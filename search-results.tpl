<h1>Pages with this search query:</h1>
<blockquote>%(`{echo $post_arg_search_app_query | escape_html}%)</blockquote>
<ul>
% start_path=`{pwd}^/sites/
% search_path=$start_path^$SERVER_NAME
% if(! ~ $#post_arg_search_app_search_directory 0){
%     search_path=$search_path^$req_path
% }
% if(! ~ $#post_arg_search_app_query 0){
%     ripgrep_matches=`{rg -i -l $post_arg_search_app_query $search_path -g '!*_werc*' -g '!**/_*' -g '!*.meta'}
% }
% for(match in $ripgrep_matches){
<li>
% href_path=`{echo $match | cut -d'/' -f7- | sed 's/.md//g'}
<a href="https://%($SERVER_NAME^/^$href_path%)">%($href_path%)</a>
</li>
% }
</ul>
% if(~ $#ripgrep_matches 0 || ){
<p>No matches for this query</p>
% }
