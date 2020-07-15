
(function($) {
	$.fn.validationEngineLanguage = function() {};
	$.validationEngineLanguage = {
		newLang: function() {
			$.validationEngineLanguage.allRules = 	{"required":{    			// Add your regex rules here, you can take telephone as an example
						"regex":"none",
						"alertText":"* Burayı doldurmak zorunlu",
						"alertTextCheckboxMultiple":"* Please select an option",
						"alertTextCheckboxe":"* This checkbox is required"},
					"length":{
						"regex":"none",
						"alertText":"* ",
						"alertText2":" ve ",
						"alertText3": " karakter arası uzunlukta olmalı"},
					"maxCheckbox":{
						"regex":"none",
						"alertText":"* option sınırı aşıldı"},	
					"minCheckbox":{
						"regex":"none",
						"alertText":"* ",
						"alertText2":" option seçmelisiniz"},	
					"confirm":{
						"regex":"none",
						"alertText":"* Alanlar uyuşmuyor"},		
					"telephone":{
						"regex":"/^[0-9\-\(\)\ ]+$/",
						"alertText":"* Geçersiz telefon numarası"},	
					"email":{
						"regex":"/^[a-zA-Z0-9_\.\-]+\@([a-zA-Z0-9\-]+\.)+[a-zA-Z0-9]{2,4}$/",
						"alertText":"* Geçersiz eposta adresi"},	
					"date":{
                         "regex":"/^[0-9]{4}\-\[0-9]{1,2}\-\[0-9]{1,2}$/",
                         "alertText":"* Geçersiz tarih, YYYY-AA-GG formatına göre yazınız"},
					"onlyNumber":{
						"regex":"/^[0-9\ ]+$/",
						"alertText":"* Sadece numara girilebilir"},	
					"noSpecialCaracters":{
						"regex":"/^[0-9a-zA-Z]+$/",
						"alertText":"* Özel karakter giremezsiniz"},	
					"ajaxUser":{
						"file":"validateUser.php",
						"extraData":"name=eric",
						"alertTextOk":"* This user is available",	
						"alertTextLoad":"* Loading, please wait",
						"alertText":"* This user is already taken"},	
					"ajaxName":{
						"file":"validateUser.php",
						"alertText":"* This name is already taken",
						"alertTextOk":"* This name is available",	
						"alertTextLoad":"* Loading, please wait"},		
					"onlyLetter":{
						"regex":"/^[a-zA-Z\ \']+$/",
						"alertText":"* Sadece harflerden oluşabilir"}
					}	
		}
	}
})(jQuery);

$(document).ready(function() {	
	$.validationEngineLanguage.newLang()
});