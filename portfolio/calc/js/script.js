$(document).ready(
  function(){
    var TirSize=90, //тираж
    pricePaper = 0, //цена бумаги
    priceForm = 0, //цена формы
    pricePrint = 0; //цена печати
    var typePaper = {
      "Меловання бумага": 6.8,
      "Бумага повышенной белизны": 40.5,
      "Prestige Лен": 4.5
    };
    //for (x in typePaper)
  //  {
  //    console.log(x);
  //    console.log(typePaper[x]);
  //  }
  selectPaper();

    function selectPaper(){
      var html = "";
      for (x in typePaper)
        html+="<option value'"+x+"'>"+x+"</option>";
        $("#Paper").append(html);
    }
  }
)
