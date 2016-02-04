<#-- @ftlvariable name="pageable" type="org.onehippo.cms7.essentials.components.paging.Pageable" -->
<#include "../include/imports.ftl">
<#if pageable??>
<@hst.setBundle basename="essentials.pagination"/>
<div class="pagination-container">
    <ul class="pagination">
      <#if pageable.totalPages gt 1>
        <#list pageable.pageNumbersArray as pageNr>
            <@hst.renderURL var="pageUrl">
                <@hst.param name="page" value="${pageNr}"/>
                <@hst.param name="pageSize" value="${pageable.pageSize}"/>
            </@hst.renderURL>
            <#if pageNr_index==0>
                <#if pageable.previous>
                    <@hst.renderURL var="pageUrlPrevious">
                        <@hst.param name="page" value="${pageable.previousPage}"/>
                        <@hst.param name="pageSize" value="${pageable.pageSize}"/>
                    </@hst.renderURL>
                    <li><a href="${pageUrlPrevious}"><span class="prev"><@fmt.message key="page.previous" var="prev"/>${prev?html}</span></a></li>
                <#else>
                    <li class="disabled"><span class="prev"><@fmt.message key="page.previous" var="prev"/>${prev?html}</span></li>
                </#if>
            </#if>

            <#if pageable.currentPage == pageNr>
                <li class="active"><a href="#"><span class="current">${pageNr}</span></a></li>
            <#else>
                <li><a href="${pageUrl}"><span>${pageNr}</span></a></li>
            </#if>

            <#if !pageNr_has_next>
                <#if pageable.next>
                    <@hst.renderURL var="pageUrlNext">
                        <@hst.param name="page" value="${pageable.nextPage}"/>
                        <@hst.param name="pageSize" value="${pageable.pageSize}"/>
                    </@hst.renderURL>
                    <li><a href="${pageUrlNext}"><span class="next"><@fmt.message key="page.next" var="next"/>${next?html}</span></a></li>
                <#else>
                    <li class="disabled"><span class="next"><@fmt.message key="page.next" var="next"/>${next?html}</span></li>
                </#if>
            </#if>
        </#list>
      </#if>
    </ul>
</div>
</#if>