function squareCalc()
{
  var a=document.fl.inA.value;
  var b=document.fl.inB.value;
  var c=document.fl.inC.value;
  var ans=document.getElementById("answer");
  var korni="";
  var D=b^2-4*a*c;
  if(D<0)
    korni+="Нет вещественных корней";
    else if (D>0)
    {
      korni+="Два вещественных корня - :"
      var x1=(-b+Math.sqrt(D))/(2*a);
      var x2=(-b-Math.sqrt(D))/(2*a);
      korni+="x<sub>l</sub>="+x1+"x<sub>2</sub>"+x1;
    }
    else
    {
      korni+="Один вещественный корень - :"
      var x=-b/(2*a);
      korni+="x<sub>l</sub>=x<sub>2</sub>"+x;
    }
  ans.innerHTML=korni;
}
