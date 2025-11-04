function sumAll(){
  // 매개변수가 없으면 -999 return / 매개변수 있으면 매개변수 합 return
    let resultSum = 0;
    if(arguments.length==0){
        return -999;
    }else{
        for(let data of arguments){
            resultSum += data;
        }
    }
    return resultSum;
}
