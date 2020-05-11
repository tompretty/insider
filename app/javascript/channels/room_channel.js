import consumer from "./consumer";

function connect(id) {
  consumer.subscriptions.create(
    { channel: "RoomChannel", id: id },
    {
      connected() {
        console.log("connected");
        console.log(id);
      },

      disconnected() {
        console.log("disconnected");
      },

      received(data) {
        console.log("received");
        location.reload();
      }
    }
  );
}

document.addEventListener("turbolinks:load", () => {
  let app = document.getElementById("app");
  if (app) {
    let id = app.dataset.id;
    connect(id);
  }
});
