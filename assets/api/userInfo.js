const getUserinfo = () => {
    userInfo.koreanName = document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[1]/div[1]/div[2]/div/div[1]/div[2]/div[2]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.innerText;
    userInfo.englishName = document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[1]/div[1]/div[2]/div/div[1]/div[3]/div[2]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.innerText;
    userInfo.studentNumber = document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[1]/div[1]/div[2]/div/div[1]/div[1]/div[2]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.innerText;
    userInfo.college = document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[1]/div[1]/div[2]/div/div[3]/div[1]/div[2]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.innerText;
    userInfo.department = document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[1]/div[1]/div[2]/div/div[3]/div[2]/div[2]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.innerText;
    userInfo.grade = document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[1]/div[1]/div[2]/div/div[2]/div[4]/div[2]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.innerText;
    userInfo.gender = document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[1]/div[1]/div[2]/div/div[2]/div[2]/div[2]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.innerText;
};
const getUserclass = async () => {
    const classSemestertbody = () => document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[6]/div/div/div[1]/div/div[2]/div/div/table/tbody", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    //학기별 위치

    const classSubjecttbody = () => document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[6]/div/div/div[2]/div/div[2]/div/div/table/tbody", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    //과목별 위치
    //학기 갯수 만큼 반복
    userInfo.class = {};
    weekDate = ['월','화','수','목','금']
    for (let i = 0; i < classSemestertbody().getElementsByTagName("tr").length - 1; i++) {
        //학기정보 저장 최근 학기부터
        let classSemester = classSemestertbody()
            .getElementsByTagName("tr")
            [i + 1].getElementsByTagName("td")[0].innerText;
        //학기조회 버튼 클릭
        classSemestertbody()
            .getElementsByTagName("tr")
            [i + 1].getElementsByTagName("td")[0]
            .getElementsByTagName("a")[0]
            .click();

        //학기별 정보 로딩 대기
        await new Promise((r) => {
            let ids = setInterval(() => {
                //조회한 학기 값
                tmp = classSemestertbody()
                    .getElementsByClassName("bg-warning")[0]
                    .getElementsByTagName("td")[0].innerText;
                //클릭한 학기값과 조회한 학기 값이 같다면
                if (tmp === classSemester) {
                    semesterInfo = tmp.replace(/(\\t|\\n)/g, "");
                    userInfo.class[semesterInfo] = [[],[],[],[],[]];
                    //과목 갯수만큼 반복
                    for (let j = 0; j < classSubjecttbody().getElementsByTagName("tr").length - 1; j++) {
                        subjectInfo = classSubjecttbody()
                            .getElementsByTagName("tr")
                            [j + 1].getElementsByTagName("td")[1].innerText;
                        // userInfo.class[semesterInfo][subjectInfo] = {};
                        //
                        // let classrooms = {};
                        strcc = classSubjecttbody()
                            .getElementsByTagName("tr")
                            [j + 1].getElementsByTagName("td")[6].innerText;

                        if (strcc.length > 1) {
                            tmpcc = strcc.split("(");
                            classroomcc = tmpcc[0].split(",");
                            schedulecc = tmpcc[1].slice(0, -1).split(",");

                            if (classroomcc.length === 1) {
                                // datesList = ["월","화","수","목","금"]
                                datestmpcc = "";
                                datetmpcc = "";
                                classtmpcc = classroomcc[0];
                                for (let p = 0; p < schedulecc.length; p++) {
                                    if (isNaN(parseInt(schedulecc[p]))) {
                                        datestmpcc = weekDate.indexOf(schedulecc[p][0])
                                        datetmpcc = schedulecc[p].slice(1);
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc] = []
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc].push(subjectInfo);
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc].push(1);
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc].push(classtmpcc);
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc].push(classSubjecttbody()
                                            .getElementsByTagName("tr")
                                            [j + 1].getElementsByTagName("td")[7].innerText)

                                    } else {
                                        if (datestmpcc === "") {
                                            if (datetmpcc === "") {
                                                for (let t = 0; t < 5; t++) {
                                                    userInfo.class[semesterInfo][t][schedulecc[p]] = [];
                                                    userInfo.class[semesterInfo][t][schedulecc[p]].push(subjectInfo);
                                                    userInfo.class[semesterInfo][t][schedulecc[p]].push(1);
                                                    userInfo.class[semesterInfo][t][schedulecc[p]].push(classtmpcc);
                                                    userInfo.class[semesterInfo][t][schedulecc[p]].push(classSubjecttbody()
                                                        .getElementsByTagName("tr")
                                                        [j + 1].getElementsByTagName("td")[7].innerText)
                                                }
                                                datetmpcc = schedulecc[p];
                                            } else {
                                                for (let y = 0; y < 5; y++) {
                                                    userInfo.class[semesterInfo][y][datetmpcc][1] += 1;
                                                }
                                            }
                                        } else {userInfo.class[semesterInfo][datestmpcc][datetmpcc][1] += 1;}

                                    }
                                }
                            } else {
                                datestmpcc = "";
                                datetmpcc = "";
                                classtmpcc = classroomcc[0];
                                classtmpcountcc = 0;
                                for (let p = 0; p < schedulecc.length; p++) {
                                    if (isNaN(parseInt(schedulecc[p]))) {
                                        datestmpcc = weekDate.indexOf(schedulecc[p][0])
                                        datetmpcc = schedulecc[p].slice(1);
                                        classtmpcc = classroomcc[classtmpcountcc];
                                        classtmpcountcc += 1;
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc] = []
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc].push(subjectInfo);
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc].push(1);
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc].push(classtmpcc);
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc].push(classSubjecttbody()
                                            .getElementsByTagName("tr")
                                            [j + 1].getElementsByTagName("td")[7].innerText)
                                    } else {
                                        userInfo.class[semesterInfo][datestmpcc][datetmpcc][1] += 1;

                                    }
                                }
                            }
                        }
                    }
                    //현재 인터벌 초기화
                    clearInterval(ids);
                    r();
                }
            }, 1000);
        });
    }
};
const getUserscore = async () => {
    const scoreSemestertbody = () => document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[7]/div[2]/div/div[1]/div/div[2]/div/table/tbody", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    //학기별 위치

    const scoreSubjecttbody = () => document.evaluate("/html/body/form/div[6]/div/div[3]/div/div/div[7]/div[2]/div/div[2]/div/div[2]/div/div/table/tbody", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    //과목별 위치
    //학기 갯수 만큼 반복
    userInfo.score = {};
    for (let i = 0; i < scoreSemestertbody().getElementsByTagName("tr").length - 1; i++) {
        //학기정보 저장 최근 학기부터
        let scoreSemester = scoreSemestertbody()
            .getElementsByTagName("tr")
            [i + 1].getElementsByTagName("td")[0].innerText;
        //학기조회 버튼 클릭
        scoreSemestertbody()
            .getElementsByTagName("tr")
            [i + 1].getElementsByTagName("td")[0]
            .getElementsByTagName("a")[0]
            .click();

        //학기별 정보 로딩 대기
        await new Promise((r) => {
            let id = setInterval(() => {
                //조회한 학기 값
                tmp = scoreSemestertbody()
                    .getElementsByClassName("bg-warning")[0]
                    .getElementsByTagName("td")[0].innerText;
                //클릭한 학기값과 조회한 학기 값이 같다면
                if (tmp === scoreSemester) {
                    semesterInfo = tmp.replace(/(\\t|\\n)/g, "");
                    userInfo.score[semesterInfo] = {};
                    userInfo.score[semesterInfo].creditSign = scoreSemestertbody()
                        .getElementsByTagName("tr")
                        [i + 1].getElementsByTagName("td")[1].innerText;
                    userInfo.score[semesterInfo].credit = scoreSemestertbody()
                        .getElementsByTagName("tr")
                        [i + 1].getElementsByTagName("td")[2].innerText;
                    userInfo.score[semesterInfo].creditAvg = scoreSemestertbody()
                        .getElementsByTagName("tr")
                        [i + 1].getElementsByTagName("td")[4].innerText;
                    userInfo.score[semesterInfo].rank = scoreSemestertbody()
                        .getElementsByTagName("tr")
                        [i + 1].getElementsByTagName("td")[6].innerText;

                    userInfo.score[semesterInfo].subjectScore = {};
                    //과목 갯수만큼 반복
                    for (let j = 0; j < scoreSubjecttbody().getElementsByTagName("tr").length - 1; j++) {
                        subjectInfo = scoreSubjecttbody()
                            .getElementsByTagName("tr")
                            [j + 1].getElementsByTagName("td")[1].innerText;
                        userInfo.score[semesterInfo].subjectScore[subjectInfo] = {};
                        userInfo.score[semesterInfo].subjectScore[subjectInfo].credit = scoreSubjecttbody()
                            .getElementsByTagName("tr")
                            [j + 1].getElementsByTagName("td")[5].innerText;
                        userInfo.score[semesterInfo].subjectScore[subjectInfo].gradeSymbol = scoreSubjecttbody()
                            .getElementsByTagName("tr")
                            [j + 1].getElementsByTagName("td")[6].innerText;
                    }
                    //현재 인터벌 초기화
                    clearInterval(id);
                    r();
                }
            }, 1000);
        });
    }
};
let userInfo = {};
dataStatus = false
const getData = async () => {
    try {
        await getUserinfo();
    } catch (e) {
    }
    try {
        await getUserclass();
    } catch (e) {
    }
    try {
        await getUserscore();
    } catch (e) {
    }
    userInfo = JSON.stringify(userInfo);
    dataStatus = true
};
getData();
