const getFinalExam = async () => {
    const finalExamtbody = () => document.evaluate("/html/body/form/div[6]/div/div[3]/div[2]/div[2]/div/table/tbody", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    for (let i = 0; i < finalExamtbody().getElementsByTagName("tr").length - 1; i++) {
        let classtr = finalExamtbody()
            .getElementsByTagName("tr")
            [i + 1];
        finalExam[classtr.getElementsByTagName("td")[2].innerText] = []
        finalExam[classtr.getElementsByTagName("td")[2].innerText].push(classtr.getElementsByTagName("td")[0].innerText)
        finalExam[classtr.getElementsByTagName("td")[2].innerText].push(classtr.getElementsByTagName("td")[1].innerText)
        finalExam[classtr.getElementsByTagName("td")[2].innerText].push(classtr.getElementsByTagName("td")[3].innerText)
        finalExam[classtr.getElementsByTagName("td")[2].innerText].push(classtr.getElementsByTagName("td")[4].innerText)
        finalExam[classtr.getElementsByTagName("td")[2].innerText].push(classtr.getElementsByTagName("td")[5].innerText)
    }
};
finalExam = {};
dataStatus = false
const getData = async () => {
    try {
        await getFinalExam();
    } catch (e) {
    }
    finalExam = JSON.stringify(finalExam);
    dataStatus = true
};
getData();

//https://m.bufs.ac.kr/SCRO/SCRO2030.ASPX?mc=1018
