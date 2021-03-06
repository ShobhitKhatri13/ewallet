<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
.container{
    width: 100vw;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    font-family: sans-serif;
    font-weight: 100;    
    color: white;
}
.card{
    width: 700px;
    height: 300px;
    position: relative;
    background: linear-gradient(to top right, rgb(11,63,87), rgb(78,68,68));
    box-shadow: 1px 20px 50px grey;
    border-radius: 5px;
    padding: 1em;
    z-index: 2;
}

.card .top{
    display: flex;
    justify-content: space-between;
    align-items: center;
}

h1{
    font-size: 32px;
    text-transform: uppercase;
}
h2{
    font-size: 12px;
    text-transform: uppercase;
    letter-spacing: 1px;
}

h3{
    position: absolute;
    bottom: -35px;
    left: 30px;
    font-size: 160px;
    text-transform: uppercase;
    color: rgb(104,101,101);
    opacity: 0.1;
    z-index: -1;
}

.card .mid{
    display: flex;
    flex-direction: column;
    margin-top: 20px;
}

.card .mid .card-number span{
    border: 1px solid grey;
    padding: 3px 5px;
    display: inline-block;
    font-size: 14px;
    letter-spacing: 1px;
    border-radius: 2px;
}

.card-number span + span{
    margin: 8px 15px;
}

.card .bottom{
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 20px;
}
.card .bottom span{
    display: inline-block;
    border: 1px solid grey;
    padding: 2px 4px;
    border-radius: 2px;
    font-size: 14px;
    margin-top: 5px;
    text-transform: uppercase;
}

.card .bottom .card-holder span{
    width: 150px;
    height: 22px;
}
.bottom span + span{
    margin-left: 5px;
}
</style>
</head>
<body>

<div class="container">

        <div class="card">
             <h3><i>visa</i></h3>
            <div class="top">
                <h1><i>visa</i></h1>
                <h2>credit card</h2>
            </div>

            <div class="mid">
                <h2>card number</h2>
                <div class="card-number">
                    <span><input type="number" name="cno" placeholder="Card No"></span>
                </div>
            </div>

            <div class="bottom">
                <div class="card-holder">
                    <h2>card holder</h2>
                    <span><input type="text" name="cnm" placeholder="Holder Name"></span>
                </div>   
                <div class="express">
                    <h2>express</h2>
                    <span><input type="text" name="dt" placeholder="Month/Year"></span>
            
                    
                </div>      
                <div class="cvv">
                    <h2>cvv</h2>
                    <span><input type="number" name="cvv" placeholder="CVV"></span>
                    
                </div>
                
           
            
                
            </div>
				
				<br>
				<br>
				<div class=subbmit">
					<span><center><input type="submit" value="Submit"></center></span>
				</div>
        </div>

    </div>
</body>
</html>