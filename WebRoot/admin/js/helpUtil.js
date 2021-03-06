$(function(){

    goPage(1,20);
    var tempOption="";
    for(var i=1;i<=totalPage;i++)
    {
        tempOption+='<option value='+i+'>'+i+'</option>'
    }
    $("#jumpWhere").html(tempOption);
})


var pageSize=0;//每页显示行数
var currentPage_=1;//当前页全局变量，用于跳转时判断是否在相同页，在就不跳，否则跳转。
var totalPage;//总页数
function goPage(pno,psize){
    var itable = document.getElementById("DataGrid1");
    var num = itable.rows.length;//表格所有行数(所有记录数)

    pageSize = psize;//每页显示行数
    //总共分几页 
    if(num/pageSize > parseInt(num/pageSize)){
        totalPage=parseInt(num/pageSize)+1;
    }else{
        totalPage=parseInt(num/pageSize);
    }
    var currentPage = pno;//当前页数
    currentPage_=currentPage;
    var startRow = (currentPage - 1) * pageSize+1;
    var endRow = currentPage * pageSize;
    endRow = (endRow > num)? num : endRow;

    $("#DataGrid1 tr").hide();
    for(var i=startRow-1;i<endRow;i++)
    {
        $("#DataGrid1 tr").eq(i).show();
    }
    var tempStr = "共"+num+"条记录 分"+totalPage+"页 当前第"+currentPage+"页";
    document.getElementById("barcon1").innerHTML = tempStr;

    if(currentPage>1){
        $("#firstPage").on("click",function(){
            goPage(1,psize);
        }).removeClass("ban");
        $("#prePage").on("click",function(){
            goPage(currentPage-1,psize);
        }).removeClass("ban");
    }else{
        $("#firstPage").off("click").addClass("ban");
        $("#prePage").off("click").addClass("ban");
    }

    if(currentPage<totalPage){
        $("#nextPage").on("click",function(){
            goPage(currentPage+1,psize);
        }).removeClass("ban")
        $("#lastPage").on("click",function(){
            goPage(totalPage,psize);
        }).removeClass("ban")
    }else{
        $("#nextPage").off("click").addClass("ban");
        $("#lastPage").off("click").addClass("ban");
    }

    $("#jumpWhere").val(currentPage);
}

function jumpPage()
{
    var num=parseInt($("#jumpWhere").val());
    if(num!=currentPage_)
    {
        goPage(num,pageSize);
    }
}