<%@ page pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp" %>

<table class="table table-hover">
	<thead>
		<tr>
			<th>Mã</th>
			<th>Tên sản phẩm</th>
			<th>Mức lương</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="item" items="${order.orderDetails}">
		<tr>
			<td>${item.product.id}</td>
			<td>${item.product.name}</td>
			<td>$<f:formatNumber value="${item.product.unitPrice}" pattern="#,###.00"/></td>
		</tr>
	</c:forEach>
	</tbody>
</table>