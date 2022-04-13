<%@ page pageEncoding="utf-8" %>
<%@ include file="/common/taglib.jsp" %>

<c:forEach var="p" items="${list}">
    <f:formatNumber value="${p.unitPrice}" pattern="#,###.00" var="price" />
    <f:formatDate value="${p.productDate}" pattern="dd-MM-yyyy"
                  var="date" />
    <div class="col-md-12 col-sm-6 nn-prod" data-id="${p.id}">
        <div class="panel panel-success">
            <div class="panel-heading text-center">
                <h4 class="panel-title">${p.name}</h4>
            </div>
            <%--<div class="row">
                <div class="panel-body col-sm-3">
                    <div class="panel-body text-left">
                        <a href="/product/detail/${p.id}"><img src="/static/images/products/${p.image}"/></a>
                    </div>
                </div>
                <div class="panel-body col-sm-9">
                    <div class="row">
                        <div>
                                ${p.name}
                        </div>
                        <div>Địa chỉ : ${p.address}</div>
                        <div>Lương : ${p.unitPrice}</div>
                        <div>Lượt xem: ${p.viewCount}
                        </div>
                        <ul class="col-sm-7">
                            <li><strong>Name</strong>: <em>${prod.name}</em></li>
                            <li><strong>Unit Price</strong>: <em>${price}</em></li>
                                &lt;%&ndash;<li><strong>Discount</strong>: <em><f:formatNumber value="${prod.discount}" type="percent"/></em></li>&ndash;%&gt;
                                &lt;%&ndash;	<li><strong>Quantity</strong>: <em>${prod.quantity}</em></li>&ndash;%&gt;
                            <li><strong>Product Date</strong>: <em>${date}</em></li>
                            <li><strong>Available</strong>: <em>${prod.available}</em></li>
                            <li><strong>Category</strong>: <em>${prod.category.nameVN}</em></li>
                        </ul>
                    </div>
                </div>
            </div>--%>
            <div class="panel-body">
                <div class="col-sm-5 text-center">
                    <a href="/product/detail/${p.id}"><img src="/static/images/products/${p.image}"/></a>
                </div>
                <ul class="col-sm-7">
                    <li><strong>Tên Job</strong>: <em>${p.name}</em></li>
                    <li><strong>Lương</strong>: <em>${price}</em></li>
                    <li><strong>Ngày đăng</strong>: <em>${date}</em></li>
                    <li><strong>Trạng thái</strong>: <em>${p.available}</em></li>
                    <li><strong>Ngôn ngữ</strong>: <em>${p.category.nameVN}</em></li>
                    <li><strong>Lượt xem</strong>: <em>${p.viewCount}</em></li>
                </ul>
            </div>
            <div class="panel-footer text-right">
                <div class="row">
                        <%--\<div class="col-xs-3">${p.unitPrice}</div>--%>
                    <div class="col-xs-9 text-right">
                        <%@include file="btn-prod.jsp" %>
                    </div>
                </div>
            </div>
            <c:choose>
                <%--				<c:when test="${p.discount > 0}">
                                    <img src="/static/images/promo-icon.gif"/>
                                </c:when>--%>
                <c:when test="${p.available}">
                    <img src="/static/images/special-icon.gif"/>
                </c:when>
            </c:choose>
        </div>
    </div>
</c:forEach>
<%@include file="dialog.jsp" %>

