<#include "../include/imports.ftl">

<div class="body-wrapper">
    <div class="container">
        <div class="row">
            <div class="col-md-9 col-sm-9">
                <div class="news-overview">
                    <#if pageable?? && pageable.items?has_content>
                        <#list pageable.items as item>
                            <@hst.link var="link" hippobean=item />
                            <div class="blog-post">
                                <@hst.cmseditlink hippobean=item />
                                <div class="blog-post-type">
                                    <i class="icon-news"> </i>
                                </div>
                                <div class="blog-span">
                                    <#if item.image?? && item.image.large??>
                                        <@hst.link var="img" hippobean=item.image.large />
                                        <div class="blog-post-featured-img">
                                            <a href="${link}"><img src="${img}" alt="${item.title?html}" /></a>
                                        </div>
                                    </#if>
                                    <h2><a href="${link}" title="${item.title?html}">${item.title?html}</a></h2>
                                    <div class="blog-post-body">
                                        <p>${item.location?html}</p>
                                        <p>${item.introduction?html}</p>
                                    </div>

                                    <div class="blog-post-details">
                                        <#if item.date?? && item.date.time??>
                                            <div class="blog-post-details-item blog-post-details-item-left icon-calendar"><@fmt.formatDate value=item.date.time type="both" dateStyle="medium" timeStyle="short"/></div>
                                        </#if>

                                        <div class="blog-post-details-item blog-post-details-item-right">
                                            <a href="${link}" title="${item.title?html}">Read more<i class="fa fa-chevron-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </#list>
                        <#if cparam.showPagination>
                            <#include "../include/pagination.ftl">
                        </#if>
                    <#-- @ftlvariable name="editMode" type="java.lang.Boolean"-->
                    <#elseif editMode>
                        <img src="<@hst.link path='/images/essentials/catalog-component-icons/news-list.png'/>"> Click to edit News List
                    </#if>
                </div>
            </div>
        </div>
    </div>
</div>


