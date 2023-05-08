const getMidtermExam = async () => {
    const midtermtbody = () => document.evaluate("/html/body/form/div[6]/div/div[3]/div[2]/div[2]/div/table/tbody", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
    for (let i = 0; i < midtermtbody().getElementsByTagName("tr").length - 1; i++) {
        let classtr = midtermtbody()
            .getElementsByTagName("tr")
            [i + 1];
        midtermScore[classtr.getElementsByTagName("td")[2].innerText] = []
        midtermScore[classtr.getElementsByTagName("td")[2].innerText].push(classtr.getElementsByTagName("td")[0].innerText)
        midtermScore[classtr.getElementsByTagName("td")[2].innerText].push(classtr.getElementsByTagName("td")[1].innerText)
        midtermScore[classtr.getElementsByTagName("td")[2].innerText].push(classtr.getElementsByTagName("td")[3].innerText)
        midtermScore[classtr.getElementsByTagName("td")[2].innerText].push(classtr.getElementsByTagName("td")[4].innerText)
        midtermScore[classtr.getElementsByTagName("td")[2].innerText].push(classtr.getElementsByTagName("td")[5].innerText)
    }
};
midtermExam = {};
dataStatus = false
const getData = async () => {
    try {
        await getMidtermExam();
    } catch (e) {
    }
    midtermExam = JSON.stringify(midtermExam);
    dataStatus = true
};
getData();

//https://m.bufs.ac.kr/SCRO/SCRO2020.ASPX?mc=1017
