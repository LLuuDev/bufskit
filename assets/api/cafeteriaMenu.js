const getCafeteriaMenu = async () => {
    for (let i = 0; i<5; i++) {
        tmpCafeteriaMenu = {}
        breakfastList = document.getElementsByTagName("table")[i+1].getElementsByTagName("td")[3].innerText.replace("\\n","").trim().split(",");
        tmpCafeteriaMenu["조식"] = breakfastList
        cornerlist = []
        cornerlist.push(document.getElementsByTagName("table")[i+1].getElementsByTagName("td")[6].innerText.replace("\\n","").trim())
        cornerlist.push(document.getElementsByTagName("table")[i+1].getElementsByTagName("td")[7].innerText.replace("\\n","").trim())
        cornerlist.push(document.getElementsByTagName("table")[i+1].getElementsByTagName("td")[8].innerText.replace("\\n","").trim())
        cornerlist.push(document.getElementsByTagName("table")[i+1].getElementsByTagName("td")[10].innerText.replace("\\n","").trim())
        cornerlist.push(document.getElementsByTagName("table")[i+1].getElementsByTagName("td")[12].innerText.replace("\\n","").trim())
        cornerlist.push(document.getElementsByTagName("table")[i+1].getElementsByTagName("td")[13].innerText.replace("\\n","").trim())
        cornerlist.push(document.getElementsByTagName("table")[i+1].getElementsByTagName("td")[14].innerText.replace("\\n","").trim())
        tmpCafeteriaMenu["중식/석식"] = cornerlist
        commonlist = document.getElementsByTagName("table")[i+1].getElementsByTagName("td")[16].innerText.replace("\\n","").trim().split(",");
        tmpCafeteriaMenu["공통찬"] = commonlist
        bunsikList = document.getElementsByTagName("table")[i+1].getElementsByTagName("td")[18].innerText.replace("\\n","").trim().split(",");
        tmpCafeteriaMenu["분식"] = bunsikList
        setmenuList = document.getElementsByTagName("table")[6].getElementsByTagName("td")[3*(i+1)].innerText.replace("\\n","").trim().split(",");
        tmpCafeteriaMenu["정식"] = setmenuList

        cafeteriaMenu[weekday[i]] = tmpCafeteriaMenu
    }
}
weekday = ['monday','tuesday','wednesday','thursday','friday']

cafeteriaMenu = {
    "monday": {},
    "tuesday": {},
    "wednesday": {},
    "thursday": {},
    "friday": {},
};

dataStatus = false;
const getData = async () => {
    try {
        await getCafeteriaMenu();
    } catch (e) {
    }
    cafeteriaMenu = JSON.stringify(cafeteriaMenu);
    dataStatus = true;
};
getData();
