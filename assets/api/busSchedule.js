data = ["8:00", "8:12", "8:22", "8:24", "8:26", "8:28", "8:30", "8:35", "8:46", "8:55", "9:00", "9:05", "9:15", "9:20", "9:22", "9:24", "9:26", "9:30", "9:40", "9:50", "10:00", "10:10", "10:20", "10:22", "10:24", "10:26", "10:28", "10:35", "10:40", "10:50", "11:00", "11:10", "11:18", "11:20", "11:22", "11:24", "11:26", "11:35", "11:45", "12:00", "12:10", "12:20", "12:25", "12:35", "12:45", "12:55", "13:10", "13:20", "13:22", "13:24", "13:26", "13:28", "13:35", "13:45", "13:50", "14:00", "14:05", "14:15", "14:25", "14:35", "14:45", "14:55", "15:05", "15:15", "15:20", "15:30", "15:50", "16:05", "16:10", "16:15", "16:25", "16:35", "16:45", "16:55", "17:05", "17:15", "17:25", "17:35", "17:45", "17:55", "18:05", "18:10", "18:15", "18:20", "18:25", "18:30", "18:35", "18:40", "18:45", "18:50", "18:55", "19:00", "19:10", "19:20", "19:40", "19:50", "20:00", "20:20", "20:40", "21:00", "21:20", "21:40", "22:00", "22:20", "22:40", "23:00",]

interval = [0, 5, 10, 14, 19]

const getBusSchedule = async () => {
    for (let j = 0; j < data.length; j++) {
        tmp = data[j].split(":");
        minutes = (parseInt(tmp[0]) * 60) + parseInt(tmp[1]);
        busSchedule["busStop0"].push(minutes + interval[0]);
        busSchedule["busStop1"].push(minutes + interval[1]);
        busSchedule["busStop2"].push(minutes + interval[2]);
        busSchedule["busStop3"].push(minutes + interval[3]);
        busSchedule["busStop4"].push(minutes + interval[4]);
    }
}

busSchedule = {
    "busStop0": [], "busStop1": [], "busStop2": [], "busStop3": [], "busStop4": []
}

dataStatus = false;
const getData = async () => {
    try {
        await getBusSchedule();
    } catch (e) {
    }
    busSchedule = JSON.stringify(busSchedule);
    dataStatus = true;
};
getData();
