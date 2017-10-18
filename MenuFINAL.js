function getReceipt() {
	var text1 = ''
	var runningTotal = 0;
	var sizeTotal = 0;
	var sizeArray = document.getElementsByClassName("size");
	for (var i = 0; i < sizeArray.length; i++) {
		if (sizeArray[i].checked) {
			var selectedSize = sizeArray[i].value;

	}
	}
	if (selectedSize === "Personal Pizza") {
		sizeTotal = 6;
	} else if (selectedSize === "Medium Pizza") {
		sizeTotal = 10;
	} else if (selectedSize === "Large Pizza") {
		sizeTotal = 14;
	} else if (selectedSize === "Extra Large Pizza") {
		sizeTotal = 16;
	}
	
	text1 = text1 +'Size :  '+ selectedSize+'$'+sizeTotal;
	runningTotal = sizeTotal;
	console.log(text1)
	getMeat(runningTotal,text1);
 };

function getMeat(runningTotal,text1) {
	var meatTotal = 0;
	var selectedMeat = [];
	var meatArray = document.getElementsByClassName("meats");

for (var j = 0; j < meatArray.length; j++) {
	if (meatArray[j].checked) {
		selectedMeat.push(meatArray[j].value);
		text1 = text1+"<br>";
		text1 = text1+ meatArray[j].value;
		console.log(text1);
		
	}
};	
var meatCount = selectedMeat.length;
	if (meatCount > 1) {
		meatTotal = (meatCount - 1);
	} else {
		meatTotal = 0;
	}

	runningTotal=runningTotal+meatTotal
	text1=text1+'      $'+meatTotal+"<br>";
	console.log(text1);

	getCheese(runningTotal,text1); 
}

// **********CHEESE************

function getCheese(runningTotal,text1){
	var cheeseTotal=0;
	var cheeseArray = document.getElementsByClassName("cheese");
			for ( var i = 0;i<cheeseArray.length; i++){
			if (cheeseArray [i].checked){
		cheese = cheeseArray[i].value;
	}			
	}
	if (cheese === "Cheese: Extra Cheese"){
	cheeseTotal = 3;}
	else if (cheese === "No"){
	cheeseTotal = 0;
	}
	else if (cheese=== "Regular"){
	cheeseTotal = 0};

	runningTotal=runningTotal+cheeseTotal
	text1=text1+cheese+'     $'+cheeseTotal+"<br>";
	console.log(text1);
	
	getCrust(runningTotal,text1);
	}
//***************** ! CHEESE**********************

//************CRUST**************
function getCrust(runningTotal,text1){
	var crustTotal=0;
	var selectCrust=[];
		crustArray = document.getElementsByClassName("crust");
		for (var i = 0;i<crustArray.length; i++){
			if(crustArray[i].checked){
			var crust = crustArray[i].value;
			
		}
		}
			if (crust === "Crust:Stuffed Crust"){
				crustTotal = 3;
				}
			else if (crust === "No Cheese"){
				crustTotal = 0;
				}

		runningTotal=runningTotal+crustTotal;
		text1=text1+crust+'     $'+crustTotal+"<br>";
		console.log (text1);
		
		 getSauce(runningTotal,text1);
}	
//************** !CRUST*************************

//**********SAUCE**************
function getSauce(runningTotal,text1){
	var selectSauce=[];
	var sauceTotal=0
		sauceArray = document.getElementsByClassName("sauce");
		for (var i = 0;i<sauceArray.length; i++){
			if(sauceArray[i].checked){
			var sauce = sauceArray[i].value;
			}
			}
		text1=text1+sauce;
		console.log(text1);

	getVeg(runningTotal,text1);
		}
//************!SAUCE*****************

//*****************VEGETABLES***************
function getVeg(runningTotal,text1) {
	var vegTotal = 0;
	var selectedVeg = [];
	var vegArray = document.getElementsByClassName("veg");

for (var j = 0; j < vegArray.length; j++) {
	if (vegArray[j].checked) {
		selectedVeg.push(vegArray[j].value);
		text1 = text1+"<br>";
		text1 = text1+ vegArray[j].value;
	}
	}

	var vegCount = selectedVeg.length;
	if (vegCount > 1) {
		vegTotal = (vegCount - 1);
		vegTotal = (vegCount - 1);
	} else {
		vegTotal = 0;

	}
		text1=text1+'$'+vegTotal;

		console.log(text1);
		runningTotal = runningTotal+vegTotal
	
//****************!VEGETABLES********************************

	// runningTotal = (runningTotal + meatTotal);
	// alert("total selected meat items: "+meatCount);
	// console.log(meatCount+" meat - 1 free meat = "+"$"+meatTotal+".00");
	// console.log("meat text1: "+text1);
	// console.log("Purchase Total: "+"$"+runningTotal+".00");
	// //document.getElementById("totalPrice").innerHTML = "</h3>Total: <strong>$"+runningTotal+".00"+"</strong></h3>";
	document.getElementById("totalPrice").innerHTML="</h3>Total: <strong>$"+runningTotal+".00"+"</strong></h3>";;
	document.getElementById("showText").innerHTML=text1
	 };
