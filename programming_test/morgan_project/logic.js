var loopStep = 1
var step = 10;
for (var t = 0; t < T; t+=loopStep) {
  // for () {
  //
  // }
  var profitA = quote(A, t+step) - quote(A, t);
  var profitB = quote(B, t+step) - quote(B, t);
  var profitC = quote(C, t+step) - quote(C, t);
  var maxOne = getMaxIndex(profitA, profitB, profitC);
  switch (maxOne) {
    case 1:
      if (profitA < 0) {
        break;
      }
      buy(A, t);
      sell(A, t+step);
      break;
    case 2:
      if (profitB < 0) {
        break;
      }
      buy(B, t);
      sell(B, t+step);
      break;
    case 3:
      if (profitC < 0) {
        break;
      }
      buy(C, t);
      sell(C, t+step);
      break;
  }

}

function getMaxIndex(a, b, c) {
  var result = null;
  if (a>b) {
    if (c>a) {
      result = 3; //c
    } else {
      result = 1; //a
    }
  } else {
    if (c>b) {
      result = 3; //c
    } else {
      result = 2; // b
    }
  }
  return result;
}
