<%@ page pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="panel-footer">
	<h4 class="panel-title">CHI TIẾT JOB</h4>
</div>
<table class="table table-hover">
	<thead>
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Salary</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="d" items="${order.orderDetails}">
			<tr>
				<td>${d.id}</td>
				<td>${d.product.name}</td>
				<td>$<f:formatNumber value="${d.product.unitPrice}" pattern="#,###.00" />
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<div class="panel-body text-center">
	<img src="/static/images/stamp.png" style="width: 100px"> <br>
	<img src="/static/images/signature.png" style="width: 200px">
</div>
