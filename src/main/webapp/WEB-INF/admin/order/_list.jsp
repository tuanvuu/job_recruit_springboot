<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<div class="panel panel-default">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Id</th>
				<th>Customer</th>
				<th>Address</th>
				<th>Order Date</th>
				<th>Thông tin CV</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${list}">
				<tr>
					<td>${item.id}</td>
					<td>${item.customer.id}</td>
					<td>${item.address}</td>
					<%--<td>${item.phone}</td>--%>
					<td>${item.orderDate}</td>
					<td><a href="${prefix}/cv/view/${item.id}">${item.attach}</a></td>
					<td class="text-center"><a href="${prefix}/edit/${item.id}"
						class="btn btn-sm btn-info"> <span
							class="glyphicon glyphicon-edit"></span>
					</a> <a href="${prefix}/delete/${item.id}"
						class="btn btn-sm btn-danger"> <span
							class="glyphicon glyphicon-trash"></span>
					</a>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

