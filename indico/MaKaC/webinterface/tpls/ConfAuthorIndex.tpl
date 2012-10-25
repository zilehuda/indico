<div class="authorIndexFiltersContainer">
    <div>
        <input type="text" id="filterAuthors" value="" placeholder="${ _('Search in authors') }">
    </div>
    <div class="authorIndexFilteredText">
        ${_("Displaying ")}<span style="font-weight:bold;" id="numberFiltered">${len(items)}</span>
        <span id="numberFilteredText">${ _("author") if len(items) == 1 else _("authors")}</span>
        ${_("out of")}
        <span style="font-weight:bold;">${len(items)}</span>
    </div>
</div>
<div class="authorIndex">
    % for key, item in items.iteritems():
        <div class="authorIndexItem">
            <div style="padding-bottom: 10px">
                <a class="authorIndexItemText" href="${item['authorURL']}">${item['fullName']}</a>
                % if item['affiliation']:
                    <span style="color: #888">(${item['affiliation']})</span>
                % endif
            </div>
            % for i, contrib in enumerate(item['contributions']):
                <div class="contribItem">
                    <a href="${contrib['url']}">${contrib['title']}</a>

                    % if contrib['materials']:
                        <img class="material_icon" title="${_('materials')}" src="./images/material_folder.png" width=12 height=12 style="cursor: pointer;"/>
                        <%include file="MaterialListPopup.tpl" args="materials=contrib['materials']"/>
                    % endif
                </div>
            % endfor

        </div>
    % endfor
</div>
