% if list:

<form action="${ postURL }" method="post" id="action_form">

<div id="list_options" class="toolbar" style="line-height: 3em;">
  <input type="text" id="filterSpeakers" value="" placeholder="${_("Search Name, Email &amp; Contributions")}"/>

  <input id="action" type="hidden"/>

  <div id="actions" class="right group">
    <a class="icon-checkbox-checked i-button arrow left icon-only" aria-hidden="true" href="#" title="${_("Select")}" data-toggle="dropdown"></a>
    <ul class="dropdown">
      <li><a href="#" id="selectAll">All</a></li>
      <li><a href="#" id="selectNone">None</a></li>
    </ul>
    <a class="icon-mail i-button left icon-only" id="send_reminder" href="#" title="${_("Send reminder")}"></a>
    <a class="icon-remove i-button left icon-only" id="remove_people" href="#" title="${_("Remove selected people")}"></a>
  </div>
</div>

<ul class="speaker_list clear">
    % for (key, pList) in list:
    <li>
        <input type="checkbox" name="pendingSubmitters" value="${str(key)}">
            % if pList[0].getEmail():
                <a href="mailto:${pList[0].getEmail()}" class="name">${pList[0].getFullName()}</a>
            % else:
                <span class="name">${pList[0].getFullName()}</span>
            % endif
        <ul class="contributions">
            % for cp in sorted(pList, self_._cmpByContribName):
                <li>
                    <% contrib = cp.getContribution() %>
                    <a href="${str(urlHandlers.UHContributionModification.getURL(contrib))}">
                        ${contrib.getTitle()}
                    </a>
                    % if pType == _("Submitters"):
                        % if contrib.isPrimaryAuthor(cp):
                            ${_("Primary Author")}
                        % elif contrib.isCoAuthor(cp):
                            ${_("Co-Author")}
                        % elif contrib.isSpeaker(cp):
                            ${_("Speaker")}
                        % endif
                    % endif
                </li>
            % endfor
        </ul>
    </li>
    % endfor
</ul>
</form>
% else:
<p>
    ${_('There are no pending requests at this time.')}
</p>
% endif

<script type="text/javascript">

function verifyFilters() {
    $(".speaker_list > li").hide();
    var term = $("#filterSpeakers").attr('value');
    var items = $("ol.contributions li:contains('"+ term +"'), " +
                  ".speaker_list li .name:contains('"+ term +"')").closest('.speaker_list > li');

    items.show();
};

$(document).ready(function() {
    $('#actions').dropdown();

    $('#selectAll').click(function() {
        $('.speaker_list li:visible input').prop('checked', true);
    });

    $('#selectNone').click(function() {
        $('.speaker_list li:visible input').prop('checked', false);
    });

    $("#filterSpeakers").keyup(function() {
        verifyFilters();
    });

    $("#send_reminder").click(function() {
        $('#action_form input#action').attr({
            name: 'reminder',
            value: 'reminder'
        });
        $('#action_form').submit();
        return false;
    })

    $("#remove_people").click(function() {
        $('#action_form input#action').attr({
            name: 'remove',
            value: 'remove'
        });
        $('#action_form').submit();
        return false;
    })

});

</script>
