const switchButton = document.getElementById("flexSwitchCheckDefault")
const layoutCard = document.getElementById("layoutCard")
const layoutTable = document.getElementById("layoutTable")
var isActive = true;

switchButton.addEventListener("change", function() {
   console.log("Ja");
   if (isActive) {
      layoutCard.hidden = true;
      layoutTable.hidden = false;
      isActive = false;
   } else {
      layoutCard.hidden = false;
      layoutTable.hidden = true;
      isActive = true;
   }
});