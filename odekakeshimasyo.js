$((function(){
	function highlight() {
		if (typeof(hljs) == 'undefined') return;
		var sql = hljs.getLanguage('sql');
		sql.c[0].bK += ' copy delimiter including csv header defaults indexes returning with';
		sql.c[0].k.keyword += ' copy delimiter including csv header defaults indexes returning with';
		hljs.registerLanguage('sql', function(){return sql;});
		hljs.initHighlighting();
	}
	
	function forceUrl() {
		if ((window.location.host == 'odekakeshimasyo.me') && (window.location.protocol != "https:"))
			window.location.protocol = "https";
		
		if (window.location.host == 'odekakeshimasyo.github.io')
			window.location.host = 'odekakeshimasyo.me';
	}
	
	function convertMarkdown() {
		if (typeof(marked) == 'undefined') return;
		$('main').append(marked($('main').html()).replace(/\r?\n/g, "<br />"));
	}
	
	return function() {
		highlight();
		forceUrl();
		convertMarkdown();
	}
})());
