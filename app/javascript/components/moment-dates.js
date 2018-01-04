import moment from 'moment';

function showTime() {
  let now = moment().format('LLLL');
  console.log("date start");
  console.log(now);
  console.log("date end");
}

export { showTime };