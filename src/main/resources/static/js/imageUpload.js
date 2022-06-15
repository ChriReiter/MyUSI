console.log("hi")


const inpFile = document.getElementById("inputFile")
const previewContainer = document.getElementById("imagePreview")
const previewImage = previewContainer.querySelector(".image-preview-image")
const previewDefaultText = previewContainer.querySelector(".image-preview-text")

const displayFile = document.querySelector(".card-img-top")

inpFile.addEventListener("change", function() {
   const file = this.files[0];

   if (file) {
       const reader = new FileReader();

       previewDefaultText.style.display = "none";
       previewImage.style.display = "block";

       reader.addEventListener("load", function() {
           console.log(this);
           previewImage.setAttribute("src", this.result);

       });

       reader.onload = function (base64) {
           localStorage["file"] = base64;
       }

       reader.readAsDataURL(file);
   } else {
       previewDefaultText.style.display = null;
       previewImage.style.display = null;
   }
});
