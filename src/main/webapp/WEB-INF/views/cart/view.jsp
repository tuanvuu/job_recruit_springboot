<%@ page pageEncoding="utf-8"%>
<%@ include file="/common/taglib.jsp"%>
<div class="panel panel-default">
	<div class="panel-heading">
		<h4 class="panel-title">THÔNG TIN ỨNG TUYỂN</h4>
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Mã job</th>
				<th>Tên job</th>
				<th>Mức Lương</th>
			</tr>
		</thead>
		<tbody class="hide-cart">
			<c:forEach var="p" items="${cart.itemsCart}">
				<tr data-id="${p.id}" data-price="${p.unitPrice}">
					<td>${p.id}</td>
					<td>${p.name}</td>
					<td>$<f:formatNumber value="${p.unitPrice}" pattern="#,###.00" />
					</td>
					<td>
						<button class="btn btn-sm btn-danger btn-cart-remove">
							<span class="glyphicon glyphicon-trash"></span>
						</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="panel-footer">
		<button class="btn btn-danger btn-cart-clear">Clear</button>
		<a href="/order/checkout" class="btn btn-success">Checkout</a>
			<div class="pull-right text-danger">${message}</div>
	</div>
</div>