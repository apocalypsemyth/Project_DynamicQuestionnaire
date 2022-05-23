﻿using DynamicQuestionnaire.Managers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DynamicQuestionnaire.BackAdmin
{
    public partial class CommonQuestionList : System.Web.UI.Page
    {
        private const int _pageSize = 10;

        private CommonQuestionManager _commonQuestionMgr = new CommonQuestionManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            string pageIndexStr = this.Request.QueryString["Index"];
            int pageIndex =
                (string.IsNullOrWhiteSpace(pageIndexStr))
                    ? 1
                    : int.Parse(pageIndexStr);

            if (!this.IsPostBack)
            {
                string keyword = this.Request.QueryString["Keyword"];
                if (!string.IsNullOrWhiteSpace(keyword))
                    this.txtKeyword.Text = keyword;

                var commonQuestionList = this._commonQuestionMgr
                    .GetCommonQuestionList(keyword, _pageSize, pageIndex, out int totalRows);

                this.ucPager.TotalRows = totalRows;
                this.ucPager.PageIndex = pageIndex;
                this.ucPager.Bind("Keyword", keyword);

                if (commonQuestionList.Count == 0)
                {
                    this.btnSearchCommonQuestion.Enabled = false;
                    this.btnDeleteCommonQuestion.Enabled = false;
                    this.gvCommonQuestionList.Visible = false;
                    this.plcEmptyCommonQuestion.Visible = true;
                    this.ucPager.Visible = false;
                }
                else
                {
                    this.btnSearchCommonQuestion.Enabled = true;
                    this.btnDeleteCommonQuestion.Enabled = true;
                    this.gvCommonQuestionList.Visible = true;
                    this.plcEmptyCommonQuestion.Visible = false;
                    this.ucPager.Visible = true;

                    this.gvCommonQuestionList.DataSource = commonQuestionList;
                    this.gvCommonQuestionList.DataBind();
                    ClientScript.RegisterStartupScript(
                        this.GetType(),
                        "ResetListCheckedForServer",
                        "ResetListCheckedForServer();",
                        true
                        );
                }
            }
        }

        protected void btnSearchCommonQuestion_Click(object sender, EventArgs e)
        {
            string keyword = this.txtKeyword.Text.Trim();

            if (string.IsNullOrWhiteSpace(keyword))
                this.Response.Redirect("CommonQuestionList.aspx");
            else
                this.Response.Redirect("CommonQuestionList.aspx?Keyword=" + keyword);
        }

        protected void btnDeleteCommonQuestion_Click(object sender, EventArgs e)
        {
            List<Guid> commonQuestionIDList = new List<Guid>();

            foreach (GridViewRow gRow in this.gvCommonQuestionList.Rows)
            {
                CheckBox ckbDeleteCommonQuestion = gRow.FindControl("ckbDeleteCommonQuestion") as CheckBox;
                HiddenField hfCommonQuestionID = gRow.FindControl("hfCommonQuestionID") as HiddenField;

                if (ckbDeleteCommonQuestion != null && hfCommonQuestionID != null)
                {
                    if (ckbDeleteCommonQuestion.Checked)
                    {
                        if (Guid.TryParse(hfCommonQuestionID.Value, out Guid commonQuestionID))
                            commonQuestionIDList.Add(commonQuestionID);
                    }
                }
            }

            if (commonQuestionIDList.Count == 0)
            {
                this.AlertMessage("請選擇要刪除的常用問題。");
                return;
            }

            bool isSuccess = 
                this._commonQuestionMgr
                .DeleteCommonQuestionListTransaction(
                commonQuestionIDList, 
                out List<string> errorMsgList
                );

            if (!isSuccess)
            {
                string errorMsg = string.Join("\\n", errorMsgList);

                this.AlertMessage(errorMsg);
                return;
            }

            this.Response.Redirect(this.Request.RawUrl);
        }

        protected void btnCreateCommonQuestion_Click(object sender, EventArgs e)
        {
            this.Response.Redirect("CommonQuestionDetail.aspx", true);
        }

        private void AlertMessage(string errorMsg)
        {
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "alert",
                "alert('" + errorMsg + "');",
                true
            );
        }
    }
}