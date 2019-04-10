<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Calcul distance</title>
</head>
<body>

	Ville 1 :
	<select class="form-control" name="ville" id="ville" onchange="getVille1(this.value)" style="margin-bottom:8px">
		<option value="<c:out value="${ville2}"/>">
		</option>
		<c:forEach var="ville1" items="${villes}">
			<option value="<c:out value="${ville1}"/>">
				<c:out value="${ville1.getNomCommune()}" />
			</option>
		</c:forEach>
	</select>
	Ville 2 :
	<select class="form-control" name="ville" id="ville" onchange="getVille2(this.value)" style="margin-bottom:8px">
		<option value="<c:out value="${ville2}"/>">
		</option>
		<c:forEach var="ville2" items="${villes}">
			<option value="<c:out value="${ville2}"/>">
				<c:out value="${ville2.getNomCommune()}" />
			</option>
		</c:forEach>
	</select>
	</br>
	<th>
		<button type="submit" class="btn btn-primary center-block" name="submit" value="calcul" id="submit" onclick="calculer()">
			<span class="glyphicon glyphicon-search"></span> Calculer
		</button>
	</th>
	</br>
	<th>
		Résultat :
		<div id="total"></div></br>
		Lat1<div id="latitude1"></div>
		Long1<div id="longitude1"></div>
		Lat2<div id="latitude2"></div>
		Long2<div id="longitude2"></div>
	</th>
	
	

</body>
<script>
	var varVille1 = null;
	var varVille2 = null;
	var oui1 = false;
	var oui2 = false;
	
	function getVille1(value){
		varVille1 = value;
		oui1 = true;
	}
	
	function getVille2(value){
		varVille2 = value;
		oui2 = true;
	}
	
	function calculer(){
		var resultat;
		if(oui1 && oui2){
			if(varVille1 != null && varVille2 != null){
				var longitude1 = parseFloat(varVille1.split(",")[6].split("=")[1].split("]")[0]);
				var longitude2 = parseFloat(varVille2.split(",")[6].split("=")[1].split("]")[0]);
				var latitude1 = parseFloat(varVille1.split(",")[5].split("=")[1].split("]")[0]);
				var latitude2 = parseFloat(varVille2.split(",")[5].split("=")[1].split("]")[0]);
				resultat = 6371*Math.acos(
	 					Math.sin(latitude1*Math.PI/180)*Math.sin(latitude2*Math.PI/180)
	 					+ Math.cos(latitude1*Math.PI/180)*Math.cos(latitude2*Math.PI/180)*Math.cos(longitude1*Math.PI/180 - longitude2*Math.PI/180));
				document.getElementById('total').innerHTML = resultat;
				document.getElementById('latitude1').innerHTML = latitude1;
				document.getElementById('longitude1').innerHTML = longitude1;
				document.getElementById('latitude2').innerHTML = latitude2;
				document.getElementById('longitude2').innerHTML = longitude2;
			}	else {
				document.getElementById('total').innerHTML = "Error";
			}		
			
		} else {
			document.getElementById('total').innerHTML = "Veuillez renseigner deux villes";
		}
		
		return resultat; 
	}
</script>
</html>