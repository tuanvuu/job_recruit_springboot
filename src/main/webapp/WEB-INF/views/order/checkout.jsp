<%@ page pageEncoding="utf-8" %>
<%@ include file="/common/taglib.jsp" %>

<!-- Shopping Cart -->
<div class="panel panel-success">
    <div class="panel-heading">
    </div>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>Mã Job</th>
            <th>Tên Job</th>
            <th>Mức lương</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="p" items="${cart.itemsCart}">
            <tr>
                <td>${p.id}</td>
                <td>${p.name}</td>
                <td>$<f:formatNumber value="${p.unitPrice}" pattern="#,###.00"/>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="panel-footer">Tổng giá : ${cart.amountCart}</div>
</div>

<!-- Purchase Form -->
<form:form modelAttribute="order" action="/order/checkout" enctype="multipart/form-data">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <div class="text-danger pull-right">${message}</div>
            <h4 class="panel-title">THÔNG TIN ỨNG TUYỂN</h4>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="form-group col-sm-6">
                    <label>Tên ứng viên</label>
                    <form:input path="customer.fullname"
                                placeholder="Vui lòng nhập họ tên" required="required"
                                class="form-control"/>
                </div>
                <div class="form-group col-sm-6">
                    <label>Đính kèm cv</label>
                    <form:hidden path="attach"/>
                    <input name="image_file" type="file" class="form-control"/>
                </div>
            </div>
            <div class="row">
                <div class="form-group col-sm-6">
                    <label>Địa chỉ ứng viên</label>
                    <form:input path="address" class="form-control"
                                placeholder="Vui lòng nhập địa chỉ" required="required"
                    />
                </div>
                <div class="form-group col-sm-6">
                    <label>Ngày ứng tuyển</label>
                    <div class="form-control">
                        <f:formatDate value="${order.orderDate}" pattern="dd-MM-yyyy"/>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="form-group col-sm-6">
                    <label>Giới thiệu bản thân</label>
                    <form:textarea path="description" rows="3" class="form-control"/>
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <button class="btn btn-primary">
                <form:hidden path="customer.id"/>
                <form:hidden path="orderDate"/>
                <span class="glyphicon glyphicon-save"></span> ỨNG TUYỂN
            </button>
        </div>
    </div>
</form:form>

