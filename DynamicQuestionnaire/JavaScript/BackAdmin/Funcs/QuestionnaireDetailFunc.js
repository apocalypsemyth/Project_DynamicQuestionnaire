﻿function SetCommonQuestionOnQuestionnaireStateSessionForServer(strSettedOrNotState) {
    if (sessionStorage.getItem(currentSetCommonQuestionOnQuestionnaireState) == null) {
        sessionStorage.setItem(currentSetCommonQuestionOnQuestionnaireState, strSettedOrNotState);
    }
}

function GetQuestionnaireInputsForServer() {
    let strCaption = $(txtCaption).val();
    let strDescription = $(txtDescription).val();
    let strStartDate = $(txtStartDate).val();
    let strEndDate = $(txtEndDate).val();
    let boolIsEnable = $(ckbIsEnable).is(":checked");

    let objQuestionnaire = {
        "caption": strCaption,
        "description": strDescription,
        "startDate": strStartDate,
        "endDate": strEndDate,
        "isEnable": boolIsEnable,
    };

    return objQuestionnaire;
}
function CheckQuestionnaireInputsForServer(objQuestionnaire) {
    let arrErrorMsg = [];
    let regex = /^[0-9]{4}\/(0[1-9]|1[0-2])\/(0[1-9]|[1-2][0-9]|3[0-1])$/;

    if (!objQuestionnaire.caption)
        arrErrorMsg.push("請填入問卷名稱。");

    if (!objQuestionnaire.description)
        arrErrorMsg.push("請填入描述內容。");

    let isUpdateMode = window.location.search.indexOf("?ID=") !== -1;
    let today = new Date().toDateString();
    let todayMillisecond = Date.parse(today);

    if (!objQuestionnaire.startDate)
        arrErrorMsg.push("請填入開始時間。");
    else {
        if (!regex.test(objQuestionnaire.startDate))
            arrErrorMsg.push(`請以 "yyyy/MM/dd" 的格式輸入開始時間。`);
        else {
            let startDate = new Date(objQuestionnaire.startDate);
            let startDateMillisecond = Date.parse(startDate);

            if (objQuestionnaire.isEnable && startDateMillisecond > todayMillisecond)
                arrErrorMsg.push("系統會屆時開放此問卷，請取消已啟用的勾選");
            else if (!isUpdateMode && startDateMillisecond < todayMillisecond)
                arrErrorMsg.push("請填入今天或其後的開始時間。");
        }
    }

    if (objQuestionnaire.endDate) {
        if (!regex.test(objQuestionnaire.endDate))
            arrErrorMsg.push(`請以 "yyyy/MM/dd" 的格式輸入結束時間。`);
        else {
            let startDate = new Date(objQuestionnaire.startDate);
            let startDateMillisecond = Date.parse(startDate);
            let endDate = new Date(objQuestionnaire.endDate);
            let endDateMillisecond = Date.parse(endDate);

            if (objQuestionnaire.isEnable && endDateMillisecond < todayMillisecond) 
                arrErrorMsg.push("若要開放此問卷，請填入今天或其後的結束時間。");
            else if (!isUpdateMode && endDateMillisecond < todayMillisecond)
                arrErrorMsg.push("請填入今天或其後的結束時間。");
            else if (startDateMillisecond > endDateMillisecond) 
                arrErrorMsg.push("請填入一前一後時序的始末日期。");
        }
    }

    if (arrErrorMsg.length > 0)
        return arrErrorMsg.join("\n");
    else
        return true;
}

function SubmitQuestionnaireForServer() {
    let strOperate = window.location.search.indexOf("?ID=") === -1 ? "CREATE" : "UPDATE";

    let objQuestionnaireForServer = GetQuestionnaireInputsForServer();
    let isValidQuestionnaireForServer =
        CheckQuestionnaireInputsForServer(objQuestionnaireForServer);
    if (typeof isValidQuestionnaireForServer === "string") {
        alert(isValidQuestionnaireForServer);
        return false;
    }

    $.ajax({
        async: false,
        url: "/API/BackAdmin/QuestionnaireDetailDataHandler.ashx?Action=TOGGLE_ISPOSTBACK_OF_BTNSUBMIT",
        method: "GET",
        success: function () {
            return true;
        },
        error: function (msg) {
            console.log(msg);
            alert(errorMessageOfAjax);
            return false;
        }
    });

    $.ajax({
        async: false,
        url: `/API/BackAdmin/QuestionnaireDetailDataHandler.ashx?Action=${strOperate}_QUESTIONNAIRE`,
        method: "POST",
        data: objQuestionnaireForServer,
        success: function (strMsg) {
            if (strMsg === FAILED) {
                alert(errorMessageOfRetry);
                return false;
            }
            else if (strMsg === SUCCESSED)
                return true;
        },
        error: function (msg) {
            console.log(msg);
            alert(errorMessageOfAjax);
            return false;
        }
    });
}

function SetQuestionListItsControlsDisabledStateSessionForServer(strDisabledState) {
    sessionStorage.setItem(currentQuestionListItsControlsDisabledState, strDisabledState);
}