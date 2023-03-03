import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css";

const flatFunc = () => {
  console.log("Test")
  flatpickr(".flatpickr", {
    enableTime: true,
    dateFormat: "D-m-y H:i",
  });
}

export { flatFunc }
