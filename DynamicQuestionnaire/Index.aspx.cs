﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DynamicQuestionnaire
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGoToQuestionnaireList_Click(object sender, EventArgs e)
        {
            this.Response.Redirect("QuestionnaireList.aspx", true);
        }
    }
}