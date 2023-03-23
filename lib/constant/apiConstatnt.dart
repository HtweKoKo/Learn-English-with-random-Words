// for RandomWordsApi*******************************
const String base_url =
    "https://random-words5.p.rapidapi.com/getMultipleRandom?";
const String count = "count";
const String wordLength = "wordLength";
const String include = "includes";
const String exclude = "excludes";
const String beginsWith = "beginsWith";
const String endsWith = "endsWith";
const Map<String, String> headerWords = {
  'X-RapidAPI-Key': '08a19835dfmshe8cb9e2fc782b40p1a1f7ejsn2286c9c55bd0',
  'X-RapidAPI-Host': 'random-words5.p.rapidapi.com'
};
//******************************************************************* */


//for googleTranslateApi*********************************
const String base_urlGetLanguage =
    "https://google-translate1.p.rapidapi.com/language/translate/v2/languages";

const Map<String, String> headerTranslate = {
  'content-type': 'application/x-www-form-urlencoded',
  'Accept-Encoding': 'application/gzip',
  'X-RapidAPI-Key': '08a19835dfmshe8cb9e2fc782b40p1a1f7ejsn2286c9c55bd0',
  'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'
};

//for RapidTranslateApi*******************************
const String base_url_rapidTranslate =
    "https://rapid-translate-multi-traduction.p.rapidapi.com/t";

const Map<String, String> headerRapid = {
  'content-type': 'application/json',
  'X-RapidAPI-Key': '08a19835dfmshe8cb9e2fc782b40p1a1f7ejsn2286c9c55bd0',
  'X-RapidAPI-Host': 'rapid-translate-multi-traduction.p.rapidapi.com'
};
  
  
  