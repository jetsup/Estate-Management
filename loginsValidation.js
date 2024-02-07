function validateSignup() {
    // check if the first name is well set
    if (document.signupForm.fname.value.trim() == "" || document.signupForm.fname.value.trim().length < 3) {
        // alert("FName");
        document.signupForm.fname.focus();
        return false;
    }
    // check if the last name is well set
    if (document.signupForm.lname.value.trim() == "" || document.signupForm.lname.value.trim().length < 3) {
        // alert("LName");
        document.signupForm.lname.focus();
        return false;
    }
    // check if the ID/Passport number is well set
    if (document.signupForm.idnumber.value.trim() == "" || document.signupForm.idnumber.value.trim().length != 8) {
        // alert("ID EMPTY");
        document.signupForm.idnumber.focus();
        return false;
    } else {
        var idString = document.signupForm.idnumber.value.trim();
        var idFormat = /^[0-9]{8}$/;
        if (!idFormat.test(idString)) {
            console.log("Check ID Number error");
            document.signupForm.idnumber.value = "";
            document.signupForm.idnumber.focus();
            return false;
        }
    }
    // check if the phone number is well set
    if (document.signupForm.phnumber.value.trim() == "" || document.signupForm.phnumber.value.trim().length < 10 || document.signupForm.phnumber.value.trim().length > 13) {
        document.signupForm.phnumber.value = "";
        document.signupForm.phnumber.focus();
        return false;
    } else {
        var phString = document.signupForm.phnumber.value.trim();
        // Iterate the string to check if it is a number
        var phnumberPattern1 = /^\+254[1|7][0-9]{8}$/;
        var phnumberPattern2 = /^0[1|7][0-9]{8}$/;

        if (!phnumberPattern1.test(phString)) {
            if (!phnumberPattern2.test(phString)) {
                console.log("Check phone Number1 error");
                document.signupForm.phnumber.value = "";
                document.signupForm.phnumber.focus();
                return false;
            }
        } else {
            // OR operator didnt work while both on the same statement
            if (!phnumberPattern2.test(phString)) {
                var phString = document.signupForm.phnumber.value.trim();
                if (!phnumberPattern1.test(phString)) {
                    console.log("Check phone Number2 error");
                    document.signupForm.phnumber.value = "";
                    document.signupForm.phnumber.focus();
                    return false;
                }
            }
        }
    }
    // check email field if it checked
    if (document.signupForm.email.value.trim() != "") {
        var email = document.signupForm.email.value.toLowerCase().trim();
        var emailFormat = /^[a-z]+[a-z0-9\.]+[a-z0-9]+@gmail.com/; // find a better syntax
        if (!emailFormat.test(email)) {
            console.log("Check email error");
            // document.signupForm.email.value = "";
            document.signupForm.email.focus();
            return false;
        }
    }
    // check select boxes
    if (document.signupForm.county.value == 0) {
        document.signupForm.county.focus();
        return false;
    }
    if (document.signupForm.town.value == 0) {
        document.signupForm.town.focus();
        return false;
    }
    // check location if set
    if (document.signupForm.location.value.trim() != "") {
        var locVariable = document.signupForm.location.value.trim();
        if (locVariable.length < 4) { // assuming that there is no location with less than three letters
            var locPattern = /^[a-z]{20}$/; // less than or equal 20 characters
            if (!locPattern.test(locVariable)) {
                document.signupForm.location.focus();
                return false;
            }
        }
    }
    // check username and password
    var username = document.getElementById("username");
    var password = document.getElementById("password");
    if (username.value.trim() == "") {
        username.focus();
        return false;
    }else{
        var userPattern = /^[a-z0-9_]{4}$/;
        if(!userPattern.test(username)){
            username.value = "";
            username.focus();
            return false;
        }
    }
    if (password.value.trim() == "") {
        password.focus();
        return false;
    }else{
        var passPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{4,}$/;
        if(!passPattern.test(password)){
            password.value = "";
            password.focus();
            return false;
        }
    }
    // check if the robot checkbox is checked
    if (!document.signupForm.robot.checked) {
        alert("Confirm that you are not a robot");
        document.signupForm.robot.focus();
        return false;
    }
}

function validateLogins() {
    var username = document.loginForm.username.value.trim();
    var password = document.loginForm.password.value.trim();

    if (username == "" || username.length < 3) {
        console.log("less");
        document.loginForm.username.value = "";
        document.loginForm.username.focus();
    } else {
        if (password == "" || password.length < 4) {
            document.loginForm.password.reset;
            document.loginForm.password.reset;
            return false;
        } else {
            /**
             * **************Properties**************
             * i            - ignore-case
             * g            - 
             * 
             * 
             * [^a]         - find any character that is not 'a'
             * [a|b]        - find either 'a' OR 'b'
             * [a-z]        - find any character for lowercase
             * [0-9]        - find any digit in the string
             * 
             * **************Metacharacters**************
             * .            - find a single character except new line or line terminator
             * \w           - find a word character
             * \W           - find non-word character
             * \d           - find a digit
             * \D           - find a non-digit
             * \s           - find a whitespace
             * \S           - find a non-whitespace
             * \b           - find a match at beginning or end of a word (\bHello)-> find Hello at the beginning (Hello\b)-> find Hello at the end
             * \B           - find a match but should not be at the beginning or at the end (specifies as above)
             * \0           - find a NULL character
             * \n           - find a newline character
             * \f           - find a form feed character
             * \r           - find a carriage return character
             * \t           - find  tab character
             * \v           - find a vertical tab character
             * \xxx         - find the character specified by the octal number
             * \xdd         - find the character specified by a hexadecimal number
             * \udddd       - find the UNICODE character specified by the hexadecimal number dddd
             * 
             * **************Quantifiers**************
             * n+           - match any string that matches at least ONE 'n'
             * n*           - match any string that contains ZERO or MORE occurrence of 'n'
             * n?           - match any string that contains ZERO or ONE occurrence of 'n'
             * n{X}.        - match any string that contains a sequence of X  n's
             * n{X,Y}.      - match any string that contains a sequence of X-Y n's
             * n{X,}.       - match any string that contains a sequence of at least X n's
             * n$.          - match any string with n at the end of it
             * ^n           - match any string with n at the beginning
             * ?=n          - match any string that is followed by a specific string n
             * ?!n          - match any string that is not followed by a specific string n
             * 
             * **************Methods/Functions**************
             * compile()-   - {Deprecated}compile a Regular Expression
             * exec()       - test for a match in a string and return the first match
             * test()       - test for a match in a string, returns true or false
             * toString()   - returns the string value of the regular expression
             */

            var allowedUsername = /[a-z0-9_]{4}/i; // the username can contain any of the specified characters
            var allowedPassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{4,}$/;

            if (allowedUsername.test(username)) {
                if (allowedPassword.test(password)) {
                    return true;
                } else {
                    document.loginForm.password.reset;
                    document.loginForm.password.setAttribute('title', 'Password error');
                    document.loginForm.password.focus();
                    return false;
                }
            } else {
                document.loginForm.username.reset;
                document.loginForm.username.focus();
                return false;
            }
        }
    }
}