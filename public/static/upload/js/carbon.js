var _carbonads = {
	init: function(where, force_serve) {
		_carbon_where = null;
		if (where) _carbon_where = where;
		var placement = this.getUrlVar('placement'),
			serve = this.getServe(force_serve ? force_serve : this.getUrlVar('serve'), placement),
			baseurl = this.getUrlVar('cd') ? this.getUrlVar('cd') : 'srv.carbonads.net';
		var forcebanner = this.getUrlVar('bsaproforce', window.location.href),
			ignore = this.getUrlVar('bsaprostats', window.location.href),
			forwardedip = this.getUrlVar('bsaforwardedip', window.location.href);
		var pro = document.createElement('script');
		pro.id = '_carbonads_projs';
		pro.type = 'text/javascript';
		pro.src = '//' + baseurl + '/ads/' + serve + '.json?segment=placement:' + placement + '&callback=_carbonads_go';
		if (forcebanner) pro.src += '&forcebanner=' + forcebanner;
		if (ignore) pro.src += '&ignore=' + ignore;
		if (forwardedip) pro.src += '&forwardedip=' + forwardedip;
		var ck = '';
		try {
			ck = decodeURIComponent(document.cookie)
		} catch (e) {};
		var day = ck.indexOf('_bsap_daycap='),
			life = ck.indexOf('_bsap_lifecap=');
		day = day >= 0 ? ck.substring(day + 12 + 1).split(';')[0].split(',') : [];
		life = life >= 0 ? ck.substring(life + 13 + 1).split(';')[0].split(',') : [];
		if (day.length || life.length) {
			var freqcap = [];
			for (var i = 0; i < day.length; i++) {
				var adspot = day[i];
				for (var found = -1, find = 0; find < freqcap.length && found == -1; find++)
					if (freqcap[find][0] == adspot) found = find;
				if (found == -1) freqcap.push([adspot, 1, 0]);
				else freqcap[found][1]++
			}
			for (var i = 0; i < life.length; i++) {
				var adspot = day[i];
				for (var found = -1, find = 0; find < freqcap.length && found == -1; find++)
					if (freqcap[find][0] == adspot) found = find;
				if (found == -1) freqcap.push([adspot, 0, 1]);
				else freqcap[found][2]++
			}
			for (var i = 0; i < freqcap.length; i++) freqcap[i] = freqcap[i][0] + ':' + freqcap[i][1] + ',' + freqcap[i][2];
			if (freqcap.length) pro.src += '&freqcap=' + encodeURIComponent(freqcap.join(';'))
		}
		document.getElementsByTagName('head')[0].appendChild(pro)
	},
	getServe: function(serve, placement) {
		var skip = ['andrewdumontme', 'bootstrapvalidatorcom', 'cooldesignjobscom', 'craftedinorg', 'dbtek', 'hackerbracket', 'launchbyte', 'markitupjaysalvatcom', 'nomadlistcom', 'photoshopsecretstumblrcom', 'theinstructionalcom', 'tympanusnet', 'wwwbuildinternetcom', 'wwwquenesscom', 'wwwravelrumbacom', 'wwwsqlreplcom', 'codylindley', 'yeungithubioopencolor', 'whatanartcom', 'photoshopsecretstumblrcom', 'mapkitio', 'hackersomecom', 'phalconphpcom', 'codyhouseco'];
		var reroute = new Array();
		reroute['onepagelove'] = 'CVYD42T';
		reroute['cssgradients'] = 'CVYD42T';
		reroute['wwwquenesscom'] = 'CVYD42T';
		reroute['realfavicongeneratornet'] = 'CVYD42T';
		reroute['hipsteripsumme'] = 'CVYD42T';
		reroute['socialdoe'] = 'CVYD42T';
		reroute['logogeekuk'] = 'CVYD42T';
		reroute['htmlxprs'] = 'CVYD42T';
		reroute['formvalidatornet'] = 'CVYD42T';
		reroute['taybenlorcom'] = 'C6AILKT';
		reroute['fontawesome'] = 'C6AILKT';
		reroute['w3bincom'] = 'CVYD42E';
		reroute['danielmiesslercom'] = 'CVYD42E';
		reroute['emojicheatsheetcom'] = 'CVYD42E';
		reroute['davidaireycom'] = 'CVYD42E';
		reroute['toddmottocom'] = 'C6AILKT';
		reroute['subtlepatternscom'] = 'C6AILKT';
		reroute['w3bincom'] = 'C6AILKT';
		reroute['icons8com'] = 'C6AILKT';
		if (skip.indexOf(placement) > 0) return 'F6AIK5T';
		if (this.isset(reroute[placement])) return reroute[placement];
		return serve
	},
	getUrlVar: function(name, target) {
		target = typeof target !== 'undefined' ? target : document.getElementById('_carbonads_js').src, name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
		var regexS = "[\\?&]" + name + "=([^&#]*)";
		var regex = new RegExp(regexS);
		var results = regex.exec(target);
		if (results == null) return '';
		else return results[1]
	},
	isset: function(v) {
		return typeof v !== 'undefined' && v != null
	},
	refresh: function() {
		this.remove(document.getElementById('_carbonads_projs'));
		this.remove(document.getElementById('carbonads'));
		this.init()
	},
	reload: function(where, force_serve) {
		this.remove(document.getElementById('_carbonads_projs'));
		this.init(where, force_serve)
	},
	remove: function(el) {
		if (typeof el !== 'undefined' && el != null) el.parentNode.removeChild(el)
	}
};

function _carbonads_go(b) {
	var ad = b['ads'][0],
		link, fulllink, image, description, time = Math.round(Date.now() / 10000) | 0;
	var placement = _carbonads.getUrlVar('placement');
	var serve = _carbonads.getUrlVar('serve');
	if (ad.html != null) {
		var ad_html = JSON.parse(ad.html);
		ad.image = ad_html.image, ad.statlink = ad_html.statlink, ad.description = ad_html.description, ad.pixel = ad_html.pixel;
		ad.fetch = ad_html.fetch;
		ad.click_redir = ad_html.click_redir
	}
	if (ad.fetch != null) {
		var fetch = document.createElement('script');
		fetch.type = 'text/javascript';
		fetch.id = '_carbonads_fetchjs';
		fetch.src = ad.fetch;
		if (ad.fetch.match('fallbacks.carbonads.com')) fetch.src += '/' + placement + '/8/';
		if (ad.click_redir != null) fetch.src += '?click_redir=' + encodeURIComponent(ad.click_redir.replace(/srv.buysellads.com/g, 'srv.carbonads.net'));
		document.getElementsByTagName('head')[0].appendChild(fetch);
		_carbonads.remove(document.getElementById('_carbonads_fetchjs'));
		return
	}
	image = ad.image;
	link = ad.statlink.split('?encredirect=');
	description = ad.description;
	if (typeof link[1] != 'undefined') fulllink = link[0] + '?segment=placement:' + placement + ';&encredirect=' + encodeURIComponent(link[1]);
	else if (link[0].search('srv.buysellads.com') > 0) fulllink = link[0] + '?segment=placement:' + placement + ';';
	else fulllink = link[0];
	fulllink = fulllink.replace(/srv.buysellads.com/g, 'srv.carbonads.net');
	var el = document.createElement('span');
	el.innerHTML = '<span class="carbon-wrap"><a href="' + fulllink.replace('[timestamp]', time) + '" class="carbon-img" target="_blank" rel="noopener"><img src="' + ad.image + '" alt="" border="0" height="100" width="130" /></a><a href="' + fulllink.replace('[timestamp]', time) + '" class="carbon-text" target="_blank" rel="noopener">' + ad.description + '</a></span>';
	if (!_carbonads.isset(ad.removecarbon)) el.innerHTML += '<a href="http://carbonads.net/?utm_source=' + placement + '&utm_medium=ad_via_link&utm_campaign=in_unit&utm_term=carbon" class="carbon-poweredby" target="_blank">ads via Carbon</a>';
	if (typeof ad.pixel != 'undefined') {
		var pixels = ad.pixel.split('||');
		for (var j = 0; j < pixels.length; j++) {
			var pix = document.createElement('img');
			pix.src = pixels[j].replace('[timestamp]', time);
			pix.border = '0';
			pix.height = '1';
			pix.width = '1';
			pix.style.display = 'none';
			el.appendChild(pix)
		}
	}
	var n = document.getElementsByClassName('carbon-wrap');
	var fdiv = document.createElement('div');
	fdiv.id = n.length > 0 ? 'carbonads_' + n.length : 'carbonads';
	fdiv.appendChild(el);
	var carbonjs = document.getElementById('_carbonads_js');
	if (carbonjs != null)
		if (_carbonads.isset(_carbon_where)) _carbon_where.appendChild(fdiv);
		else carbonjs.parentNode.insertBefore(fdiv, carbonjs.nextSibling);
	var mw = document.querySelectorAll('.carbon-img > img');
	for (var i = 0; i < mw.length; i++) mw[i].style.maxWidth = '130px';
	_bsap_serving_callback(ad.bannerid, ad.zonekey, ad.freqcap)
}
_carbonads.init();
window['_bsap_serving_callback'] = function(banner, zone, freqcap) {
	var append = function(w, data, days) {
		var c = document.cookie,
			i = c.indexOf(w + '='),
			existing = i >= 0 ? c.substring(i + w.length + 1).split(';')[0] + '%2C' : '',
			d = new Date();
		d.setTime(days * 3600000 + d);
		data = existing + data;
		data = data.substring(0, 2048);
		document.cookie = w + '=' + data + '; expires=' + d.toGMTString() + '; path=\/'
	};
	if (freqcap) {
		append('_bsap_daycap', banner, 1);
		append('_bsap_lifecap', banner, 365)
	}
};