Code for checking a valid telephone number, SSN and email address

https://tinyurl.com/ya9rsjnf
https://communities.sas.com/t5/Base-SAS-Programming/SAS-code-in-checking-a-valid-telephone-number-and-email-address/m-p/460366

This is old stuff, I suggest you check Python packages.
Thi stuff predates the rise of Python.


/* T000250 IS THE EMAIL ADDRESS VALID          */
   %let regex='/^([a-zA-Z0-9_\+\-\.]+)@([a-zA-Z0-9_\+\-\.]+)\.([a-zA-Z]{2,5})$/';
   data;if prxmatch(&regex.,trim('regusers@^%&$-@@ACHME.com'))>0 then put 'email address is ok';else put "Not Ok";run;

/* T0099740 Useful regular expressions Email addresses, SSN, compression, form repacements and SSN

Stackoverflow SAS: Some Useful regular expressions

1.  REMOVE (...) - Parentheses ans everything between
2.  Social Secutity number
    http://regexlib.com/Search.aspx?k=ssn&AspxAutoDetectCookieSupport=1
3.  Does the list contain valid  email addresses
4.

STRING COMPRSSION

HAVE

VAR=a b(ref='aaa') c d(ref='zzz')

%let var=a b(ref='aaa') c d(ref='zzz');
%put &=var;

WANT TO REMOVE (..) TO GET

VAR=a b c d


SOLUTION

%let var=a b(ref='aaa') c d(ref='zzz');

data _null_;
  var=prxchange("s/\([^)]*\)//",-1,"&var");
  put var=;
run;

*  simple

  1. \(      -> escape and look for open paranethese
  2. [^)]    -> matches all characters except ')'
  3. *       -> matches the previous  ( to ) one or more times
  4. //      -> remove (...) by sustituting nothing

X=a b c d

{[^)] Matcheshes a single character that is not contained within the brackets.
      For example, [^abc] matches any character other than "a", "b", or "c".

*  Matches the preceding element zero or more times.
   For example, ab*c matches "ac", "abc", "abbbc", etc.



VALIDATING SSNs


http://stackoverflow.com/questions/39076568/remove-certain-part-of-expression

/* T000850 Regular expressions fro checking email addresses

^\d{3}-\d{2}-\d{4}$
This regular expression will match a hyphen-separated Social Security Number (SSN) in the format NNN-NN-NNNN.

^(?!000)(?!666)(?<SSN3>[0-6]\d{2}|7(?:[0-6]\d|7[012]))([- ]?)(?!00)(?<SSN2>\d\d)\1(?!0000)(?<SSN4>\d{4})$

Updated on 3/4/2004 per feedback to additionally exclude SSNs that begin with 666 which,
as reported, are also not valid. Regular expression for validating US Social Security
Numbers. Accepts optional hyphens or spaces as formatting characters. Parses the three
subfields of the SSN into three named sub-strings (SSN1, SSN2, and SSN3) to facilitate
program use. Rejects matches on all
 zeros for any individual subfield of the Social Security Number. Matches only on those
SSNs that fall within the range of numbers currently allocated by the Social Security Administration.

^(?!000)([0-6]\d{2}|7([0-6]\d|7[012])) ([ -])? (?!00)\d\d([ -|])? (?!0000)\d{4}$

U.S. social security numbers (SSN), within the range of numbers that have been currently allocated.
Matches the pattern AAA-GG-SSSS, AAA GG SSSS, AAA-GG SSSS, AAA GG-SSSS, AAAGGSSSS, AAA-GGSSSS,
 AAAGG-SSSS, AAAGG SSSS or AAA GGSSSS. All zero in any one field is not allowed. ** Additionally,
spaces and/or dashes and/or nothing are allowed. In Michael Ash's example 123-45 6789 and 12
3456789 would fail there was a '\3' after the second octet of numbers that seemed to confuse the
regex. now any combination of spaces, dashes, or nothing will work between the SSN octets.
BoxerX.com thanks Michael for the regex!

(^(?!000)\d{3}) ([- ]?) ((?!00)\d{2}) ([- ]?) ((?!0000)\d{4})

TThis RegularExpression is used to validate the US - SSN.
This regular expression wont allow characters as well as all zeros


^(?!000)(?!666)(?!9)\d{3}([- ]?)(?!00)\d{2}\1(?!0000)\d{4}$

Updated on 3/4/2004 per feedback to additionally exclude
SSNs that begin with 666 which, as reported, are also not valid.
Regular expression for validating US Social Security Numbers.
Accepts optional hyphens or spaces as formatting characters.
Parses the three subfields of the SSN into three named sub-strings
(SSN1, SSN2, and SSN3) to facilitate program use. Rejects matches on all
 zeros for any individual subfield of the Social Security Number.
Matches only on those SSNs that fall within the range of
numbers currently allocated by the Social Security Administration.

^((?!000)(?!666)(?:[0-6]\d{2}|7[0-2][0-9]|73[0-3]|7[5-6][0-9]|77[0-2]))-((?!00)\d{2})-((?!0000)\d{4})$

Could not find a regex that truly matched the rules here
http://en.wikipedia.org/wiki/Social_Security_number#Valid_SSNs
So I modified an existing one to match the valid SSN rules.
The first digit set will not match: 000, 666, 734 to 749,
and greater than 772. * Numbers with all zeros in any digit
group (000-xx-####, ###-00-####, ###-xx-0000)

\b(?!000)(?!666)(?!9)[0-9]{3}[ -]?(?!00)[0-9]{2}[ -]?(?!0000)[0-9]{4}\b

Finds 9 digit numbers within word boundaries, not separated or separated
by - or space, not starting with 000, 666, or 900-999, not containing 00 or
0000 in the middle or at the end of SSN (in compliance with current SSN rules).



MATCHING VALID EMAIL ADDRESSES;

http://goo.gl/Waol8M
https://dzone.com/articles/regular-expression-to-validate-a-comma-separated-l?edition=206671&utm_source=Daily%20Digest&utm_medium=email&utm_campaign=dd%202016-08-27

Recently I needed to create a regular expression to validate the format of a comma-separated
list of email addresses. Just thought I’d share the result in case it is of use to anyone:

\w+@\w+\.\w+(,\s*\w+@\w+\.\w+)*
Here’s an example of applying the pattern in Java:

// Compile pattern
Pattern emailAddressPattern = Pattern.compile(String.format("%1$s(,\\s*%1$s)*", "\\w+@\\w+\\.\\w+"));
// Validate addresses
System.out.println(emailAddressPattern.matcher("xyz").matches()); // false
System.out.println(emailAddressPattern.matcher("foo@bar.com").matches()); // true
System.out.println(emailAddressPattern.matcher("foo@bar.com, xyz").matches()); // false
System.out.println(emailAddressPattern.matcher("foo@bar.com, foo@bar.com").matches()); // true


data _null_;

  * good addresses rc=1;
  str='rogerjdeangelis@gmail.com,foo@mac.com,achme@solar.com';
  rc=prxmatch('/\w+@\w+\.\w+(,\s*\w+@\w+\.\w+)*/',str);
  put rc=;

  * if rc>1 or rc=0 then one or more of the email addresses are bad;
  * if rc>1 then it corresponds to a valid address;
  str='mary.com,foo@mac.com';
  rc=prxmatch('/\w+@\w+\.\w+(,\s*\w+@\w+\.\w+)*/',str);
  put rc=;

  * if rc=0 no valid addresses;
  str='mary.com,foo.com';
  rc=prxmatch('/\w+@\w+\.\w+(,\s*\w+@\w+\.\w+)*/',str);
  put rc=;

run;quit;

/* T000250 IS THE EMAIL ADDRESS VALID

ANOTHER EMAIL ADDRESS CHECKER

%let regex='/^([a-zA-Z0-9_\+\-\.]+)@([a-zA-Z0-9_\+\-\.]+)\.([a-zA-Z]{2,5})$/';
data;
  if prxmatch(&regex.,trim('regusers@^%&$-@@ACHME.com'))>0 then put 'EMAIL ADDRESS IS OK';
   else put "Not Ok";
  if prxmatch(&regex.,trim('mary@foo.com'))>0 then put 'email address is ok';
   else put "Not Ok";
run;

/* T002170 NEW COMPRESS FUNCTION IN VERSION 9  */
  Selected list of COMPRESS modifiers (uppercase or lowercase)

  a      adds uppercase and lowercase letters
  d      adds numerals (digits)
  i      ignores case
  k      keeps listed characters instead of removing them
  s      adds space (blank, tabs, lf, cr) to the list
  p      adds punctuation

  data cmp;
    char  = "a c123xyz" ;
    phone = "(908) 777-1234";
    keepchr    =  compress("a c123xyz"    ,"0123456789"); put  'compress("a c123xyz"    ,"0123456789")    '  keepchr     ;
    dropnumspa =  compress("a c123xyz"    ,,"ds"       ); put  'compress("a c123xyz"    ,,"ds"       )    '  dropnumspa  ;
    keep12345  =  compress("a c123xyz","12345","k"     ); put  'compress("a c123xyz"char,"12345","k" )    '  keep12345   ;
    dropminpar =  compress("(908) 777-1234"," (-)"     ); put  'compress("(908) 777-1234"," (-)"     )    '  dropminpar  ;
    remnopun   =  compress("(908) 777-1234",,"ps"      ); put  'compress("(908) 777-1234",,"ps"      )    '  remnopun    ;
    keepnum    =  compress("(908) 777-1234",,"kd"      ); put  'compress("(908) 777-1234",,"kd"      )    '  keepnum     ;
  run;

  compress("a c123xyz"    ,"0123456789")    a cxyz
  compress("a c123xyz"    ,,"ds"       )    acxyz
  compress("a c123xyz"char,"12345","k" )    123
  compress("(908) 777-1234"," (-)"     )    9087771234
  compress("(908) 777-1234",,"ps"      )    9087771234
  compress("(908) 777-1234",,"kd"      )    9087771234

/* T002250 PRINTING SEQUENCE NUMBERS WITH PROC PRINT WHEN USING A WHERE CLAUSE FROM DATA _NULL_ */
   data classV / view=classV;
     set sashelp.class;
     where sex eq 'M';
   run;
   proc print data=classV;
   run;


/* capturing areacode exchange and number */
data check_posn;
   set utl_prx;
   if _n_=1 then do;
       retain re;
       /*

          \(                ****** optional open parens
            (\d{3})\        ****** any three digits - 1st chunk
           ) ?              ****** followed by optional ) or blank
            (\d{3})-(\d{4}) ****** any 3 digits followed by '-' then
                                   any four digits  2nd and 3rd chunk
       */
       re = prxparse('/\((\d{3})\) ?(\d{3})-(\d{4})/');
         if missing(re) then do;
           putlog 'ERROR: regex is malformed';
          stop;
        end;
   end;
   if prxmatch(re,phonenum) then do;
      call prxposn(re,1,areastart,arealen);            /* 1st chunk */
      areacode = substr(phonenum,areastart,arealen);
      call prxposn(re,2,exchstart,exchlen);            /* 2nd chunk */
      exchange = substr(phonenum,exchstart,exchlen);
      call prxposn(re,3,endgstart);                    /* 3rd chunk */
      ending = substr(phonenum,endgstart,4);
      output;

   end;
run;

proc print data=check_posn;
  var phonenum  areacode exchange ending;
  title 'Phone number matching (xxx) ?xxx-xxxx ';
run;

/*
Obs       phonenum       areacode    exchange    ending

 1     (909) 555-3389      909         555        3389
 2     (404)555-9977       404         555        9977
 3     (664) 555-8574      664         555        8574
 4     (703) 555-6732      703         555        6732
 5     (854)555-8493       854         555        8493
 6     (646) 555-3324      646         555        3324
 7     (646) 555-3324      646         555        3324
*/



