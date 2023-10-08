<%-- 
    Document   : createSolutions
    Created on : Oct 7, 2023, 9:04:34 PM
    Author     : tramy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>EmoMind</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@600&family=Lobster+Two:wght@700&display=swap"
            rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome CSS từ CDN -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <style>
            .active-div {
                background-color: lightblue;
            }

            .loading-screen {
                display: flex;
                flex-direction: column;
                align-items: center;
                background-color: #aaa4338f;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            }

            .spinner {
                border: 4px solid rgba(255, 255, 255, 0.3);
                border-top: 4px solid #007bff;
                border-radius: 50%;
                width: 40px;
                height: 40px;
                animation: spin 1s linear infinite;
            }

            @keyframes spin {
                0% {
                    transform: rotate(0deg);
                }
                100% {
                    transform: rotate(360deg);
                }
            }
        </style>
    </head>

    <body onload="OnLoad()">
        <!-- <div class="container-xxl p-0"> -->
        <!-- Spinner Start -->
        <div class="loading-screen position-absolute w-100 d-flex justify-content-center align-items-center d-none" style="z-index: 1000000; height: 100vh;" id="loading_process">
            <div class="spinner mx-auto"></div>
            <div class="mx-auto" style="color:  black;">PROCESSING....</div>
        </div>
        <div id="spinner"
             class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->
        <!-- Navbar Start -->
        <div class="row">
            <div class="col-12 col-md-4">
                <div class="col-12 col-md-4">
                    <img  style=" width:200px;
                          height:50px; margin-top:20px;margin-left:10px;"class="logo" src="img/Group 1.png">
                    <!-- <h2 style="background-color: #FBF8EF; color: black; margin-left: 20px; margin-top: 12px;">EmoMind</h2>-->
                </div>
                <div class="col-12 col-md-8 text-right"> <!-- S? d?ng text-right ?? ??t n?i dung bên ph?i -->
                    <!---   <a href="mailto:ntnhi2023@gmail.com">ntnhi2023@gmail.com</a>-->
                </div>
            </div>


            <nav class="navbar navbar-expand bg navbar-light sticky-top px-2px-lg-3 py-lg-0" style="background-color: #FCECB2 ">
                <a href="index.html" class="navbar-brand">

                </a>
                <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div  style="margin-left:50px;" class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav">
                        <a href="index.html" class="nav-item nav-link ">Home</a>
                        <a href="about.html" class="nav-item nav-link">About Us</a>
                        <a href="contact.html" class="nav-item nav-link">Contact</a>
                        <a href="ViewFeedbackServlet" class="nav-item nav-link">Feedback</a>
                    </div>
                    <div class="navbar-nav ml-auto"> <!-- S? d?ng ml-auto ?? ??t "Sign In" bên ph?i -->
                        <c:if test="${sessionScope.acc == null}"> 
                            <a href="login.jsp" class="nav-item nav-link ml-auto active "><i class="fas fa-user"></i> Sign In</a>
                            <a href="SignUp.jsp" class="nav-item nav-link ml-auto active "><i class="fas fa-user"></i> Sign Up</a>
                        </c:if>         

                        <c:if test="${sessionScope.acc != null}"> 
                            <a href="infor?username=${sessionScope.acc.username}" class="nav-item nav-link ml-auto active "><i class="fas fa-user"></i> Hello ${sessionScope.acc.username}</a>
                        </c:if>       
                    </div>
                </div>
        </div>
                <!-- Navbar End -->


                <!-- start create solution -->
                <div id="take_problem" class="container">
                    <div class="row justify-content-center mt-5">
                        <div class="col-md-4">
                            <h6 class="text-center mb-4">Your Current Emotion</h6>
                            <div class="form-check mb-3">
                                <input class="form-check-input" type="radio" name="selectEmotion" id="betterRadio">
                                <label class="form-check-label" for="betterRadio">
                                    Better
                                </label>
                            </div>
                            <div class="form-check mb-3">
                                <input class="form-check-input" type="radio" name="selectEmotion" id="notBetterRadio">
                                <label class="form-check-label" for="notBetterRadio">
                                    Not Better
                                </label>
                            </div>
                            <div class="form-check mb-3">
                                <input class="form-check-input" type="radio" name="selectEmotion" id="fullEnergyRadio">
                                <label class="form-check-label" for="fullEnergyRadio">
                                    I Feel Full Energy!
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="selectEmotion" id="cantTouchMeRadio">
                                <label class="form-check-label" for="cantTouchMeRadio">
                                    Any Negative Can't Touching Me.
                                </label>
                            </div>
                        </div>

                        <div class="col-md-7">
                            <div class="text-center mb-3 title" style="color: black; font-size: x-large;">Your Story:</div>
                            <div class="mb-3">
                                <div id="idContainer" class="">
                                    <div>
                                        <!-- <button class="btn btn-outline-light" type="button" onclick="Send()" id="btnSend" ><a>Send</a></button> -->
                                        <label id="lblSpeak"><input id="chkSpeak" type="checkbox" onclick="SpeechToText()" />Listen</label>

                                        <!-- <select id="selVoices"></select> -->
                                        <span id="spMsg"></span>
                                    </div>
                                    <textarea id="txtMsg" rows="10" wrap="soft" class="form-control" style="resize: none; width: 98%; margin-left: 3px; margin-top: 6px"
                                              placeholder="Input Text"></textarea>

                                    <div id="idText"></div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <button class="btn btn-outline-light" type="button" onclick="Send()" id="btnSend" ><a id="contentbtnSend" href="#">Method Healing
                            <!-- -&gt; --></a></button>
                </div>
                <div id="view_emotion" class="container w-75 mt-5 d-none">
                    <h3 class="justify-content-center w-100 text-center">Your emotion in your story:
                    </h3>

                    <div class="row" id="contentDetailEmotion">

                    </div>
                </div>

                <div id="select_question" class="container w-75 mt-5 d-none">
                    <h3 class="justify-content-center w-100 text-center">Choose if any of the following cases are suitable for you
                        <h7 class="justify-content-center w-100 text-center">For each question you choose, you will agree</h7>
                    </h3>

                    <div class="row" id="contentQuestion">

                    </div>
                </div>

                <div id="showSolution" class="container w-75 mt-5 d-none">
                    <h3 class="justify-content-center w-100 text-center">your solution:</h3>

                    <div class="row" id="contentSolution">

                    </div>

                    <form id="formFinal" action="finalEmotions" class="form-control" method="post">
                    </form>
                </div>
                <!-- end create solution -->

                <!-- Footer Start -->
                <!--    <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
                        <div class="container py-5">
                            <div class="row g-5">
                                <div class="col-lg-3 col-md-6">
                                    <h3 class="text-white mb-4">Get In Touch</h3>
                                    <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                                    <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                                    <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>
                                    <div class="d-flex pt-2">
                                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                                        <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <h3 class="text-white mb-4">Quick Links</h3>
                                    <a class="btn btn-link text-white-50" href="">About Us</a>
                                    <a class="btn btn-link text-white-50" href="">Contact Us</a>
                                    <a class="btn btn-link text-white-50" href="">Our Services</a>
                                    <a class="btn btn-link text-white-50" href="">Privacy Policy</a>
                                    <a class="btn btn-link text-white-50" href="">Terms & Condition</a>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <h3 class="text-white mb-4">Photo Gallery</h3>
                                    <div class="row g-2 pt-2">
                                        <div class="col-4">
                                            <img class="img-fluid rounded bg-light p-1" src="img/classes-1.jpg" alt="">
                                        </div>
                                        <div class="col-4">
                                            <img class="img-fluid rounded bg-light p-1" src="img/classes-2.jpg" alt="">
                                        </div>
                                        <div class="col-4">
                                            <img class="img-fluid rounded bg-light p-1" src="img/classes-3.jpg" alt="">
                                        </div>
                                        <div class="col-4">
                                            <img class="img-fluid rounded bg-light p-1" src="img/classes-4.jpg" alt="">
                                        </div>
                                        <div class="col-4">
                                            <img class="img-fluid rounded bg-light p-1" src="img/classes-5.jpg" alt="">
                                        </div>
                                        <div class="col-4">
                                            <img class="img-fluid rounded bg-light p-1" src="img/classes-6.jpg" alt="">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <h3 class="text-white mb-4">Newsletter</h3>
                                    <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
                                    <div class="position-relative mx-auto" style="max-width: 400px;">
                                        <input class="form-control bg-transparent w-100 py-3 ps-4 pe-5" type="text"
                                            placeholder="Your email">
                                        <button type="button"
                                            class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="copyright">
                                <div class="row">
                                    <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                                        &copy; <a class="border-bottom" href="#">Your Site Name</a>, All Right Reserved.
                
                                        /*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/
                                        Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
                                    </div>
                                    <div class="col-md-6 text-center text-md-end">
                                        <div class="footer-menu">
                                            <a href="">Home</a>
                                            <a href="">Cookies</a>
                                            <a href="">Help</a>
                                            <a href="">FQAs</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>-->
                <!-- Footer End -->


                <!-- Back to Top -->
                <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
                <!-- </div> -->

                <script type="text/javascript">
                    var OPENAI_API_KEY =
                            "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";
                    var bTextToSpeechSupported = false;
                    var bSpeechInProgress = false;
                    var oSpeechRecognizer = null;
                    var oSpeechSynthesisUtterance = null;
                    var oVoices = null;
                    var take_problem = document.getElementById("take_problem");
                    var view_emotion = document.getElementById("view_emotion");
                    var select_question = document.getElementById("select_question");
                    var showSolution = document.getElementById("showSolution");

                    var solution = "";
                    var isGetSolution = false;
                    var mainProblem = "";
                    var step = 1;
                    var Emotions = [];
                    var Questions;
                    var questionSelected = [];
                    function OnLoad() {
                        if ("webkitSpeechRecognition" in window) {
                        } else {
                            //speech to text not supported
                            lblSpeak.style.display = "none";
                        }

                        if ("speechSynthesis" in window) {
                            bTextToSpeechSupported = true;

                            speechSynthesis.onvoiceschanged = function () {
                                oVoices = window.speechSynthesis.getVoices();
                                for (var i = 0; i < oVoices.length; i++) {
                                    selVoices[selVoices.length] = new Option(oVoices[i].name, i);
                                }
                            };
                        }
                    }

                    function setActiveDiv(div, index) {
                        if (div.classList.contains("active-div")) {
                            div.classList.remove("active-div");
                            questionSelected = questionSelected.filter(item => item !== Questions.split('\n')[index]);
                        } else {
                            div.classList.add("active-div");
                            questionSelected.push(Questions.split('\n')[index]);
                        }
                        console.log(questionSelected.join("\n"));
                    }

                    setInterval(() => {
                        if (spMsg.innerHTML != "Processing...") {
                            document.getElementById('loading_process').classList.add("d-none");
                            if (step == 2) {
                                take_problem.classList.add("d-none");
                                view_emotion.classList.remove("d-none");
                                document.getElementById('contentbtnSend').innerHTML = "NEXT STEP";
                            } else if (step == 3) {
                                view_emotion.classList.add("d-none");
                                select_question.classList.remove("d-none");
                            } else if (step == 4) {
                                document.getElementById('btnSend').classList.add("d-none");
                                select_question.classList.add("d-none");
                                showSolution.classList.remove("d-none");
                            }
                        } else {
                            document.getElementById('loading_process').classList.remove("d-none");
                        }
                    }, 100);

                    function ChangeLang(o) {
                        if (oSpeechRecognizer) {
                            oSpeechRecognizer.lang = "en-US";
                        }
                    }
                    var sPromptSolution =
                            "I will share a story with you and provide some yes/no questions. Please analyze the emotions in my story and suggest possible solutions or strategies based on the questions and the story: ";
                    var promptGenerateQuestion =
                            "Please generate 5 yes/no questions that can help me gather more information for providing better solutions. Here's the context: ";
                    var promptEmotion =
                            "I will share a story with you. Please analyze the emotions and and provide a list of emotions with explanations. Here's my story: ";

                    function Send() {
                        if (!isGetSolution) {
                            if (txtMsg.value.trim() == "") {
                                alert("Type in your question!");
                                txtMsg.focus();
                                return;
                            }

                            mainProblem = txtMsg.value;
                            isGetSolution = true;
                        }

                        var sQuestion = "";
                        switch (step) {
                            case 1:
                                sQuestion = promptEmotion + mainProblem;
                                break;
                            case 2:
                                sQuestion = promptGenerateQuestion + mainProblem;
                                break;
                            case 3:
                                if (Questions.trim() == "") {
                                    alert("Please Select a question!");
                                    txtMsg.focus();
                                    return;
                                }
                                sQuestion = sPromptSolution + mainProblem + "\n\nYes/No Questions: " + questionSelected;
                                break;
                        }

                        spMsg.innerHTML = "Processing...";

                        var sModel = "gpt-3.5-turbo";
                        var sUrl = "https://api.openai.com/v1/chat/completions";

                        var oHttp = new XMLHttpRequest();
                        oHttp.open("POST", sUrl);
                        oHttp.setRequestHeader("Accept", "application/json");
                        oHttp.setRequestHeader("Content-Type", "application/json");
                        oHttp.setRequestHeader("Authorization", "Bearer " + OPENAI_API_KEY);
                        oHttp.onerror = function () {
                            step--;
                            Send();
                        };
                        oHttp.onreadystatechange = function () {
                            if (oHttp.readyState === 4) {
                                spMsg.innerHTML = "";

                                var oJson = {};

                                try {
                                    oJson = JSON.parse(oHttp.responseText);
                                } catch (ex) {
                                    alert(ex.message);
                                }

                                if (oJson.error && oJson.error.message) {
                                    alert(oJson.error.message);
                                } else if (oJson.choices) {
                                    var s = "";

                                    if (oJson.choices[0].text) {
                                        s = oJson.choices[0].text;
                                    } else if (oJson.choices[0].message) {
                                        s = oJson.choices[0].message.content;
                                    }

                                    if (s == "") {
                                        s = "No response";
                                    } else {
                                        handleGetData(s);
                                        step++;
                                    }
                                }
                            }
                        };

                        function handleGetData(stringResponse) {
                            switch (step) {
                                case 1:
                                    GetDataEmotion(stringResponse);
                                    break;
                                case 2:
                                    GetDataQuestionSelected(stringResponse);
                                    break;
                                case 3:
                                    renderSolution(stringResponse)
                                    TextToSpeech(stringResponse);
                                    break;
                            }
                        }

                        function GetDataQuestionSelected(stringResponse) {
                            var arrayData = stringResponse
                                    .split("\n")
                                    .filter((item) => item !== "");
                            Questions = arrayData.join("\n");

                            renderQuestion();
                        }

                        function GetDataEmotion(stringResponse) {
                            var arrayData = stringResponse
                                    .split("\n")
                                    .filter((item) => item !== "" && !isNaN(item.charAt(0)));

                            for (var i = 0; i < arrayData.length; i++) {
                                var phanTu = arrayData[i];
                                var title = "";
                                var detail = "";
                                if (phanTu.includes(":")) {
                                    title = phanTu.split(":")[0].split(". ")[1].trim();
                                    detail = phanTu.split(":").slice(1).join(":").trim();
                                } else {
                                    title = phanTu.split("-")[0].split(". ")[1].trim();
                                    detail = phanTu.split("-").slice(1).join(":").trim();
                                }

                                var obj = {title: title, detail: detail};
                                Emotions.push(obj);
                            }
                            renderEmotion();
                        }

                        var iMaxTokens = 2048;
                        var sUserId = "1";
                        var dTemperature = 0.5;

                        var data = {
                            model: sModel,
                            prompt: "My story: " + sQuestion,
                            max_tokens: iMaxTokens,
                            user: sUserId,
                            temperature: dTemperature,
                            frequency_penalty: 0.0,
                            presence_penalty: 0.0,
                            stop: ["#", ";"],
                        };

                        if (sModel.indexOf("gpt-3.5-turbo") != -1) {
                            data = {
                                model: sModel,
                                messages: [
                                    //{
                                    //    "role": "system",
                                    //    "content": "You are a helpful assistant."
                                    //                assistant messages help store prior responses
                                    //},
                                    {
                                        role: "user",
                                        content: sQuestion,
                                    },
                                ],
                            };
                        }

                        oHttp.send(JSON.stringify(data));
                    }

                    function TextToSpeech(s) {
                        if (bTextToSpeechSupported == false)
                            return;

                        oSpeechSynthesisUtterance = new SpeechSynthesisUtterance();

                        if (oVoices) {
                            var sVoice = selVoices.value;
                            if (sVoice != "") {
                                oSpeechSynthesisUtterance.voice = oVoices[parseInt(sVoice)];
                            }
                        }

                        oSpeechSynthesisUtterance.onend = function () {
                            if (oSpeechRecognizer && chkSpeak.checked) {
                                oSpeechRecognizer.start();
                            }
                        };

                        if (oSpeechRecognizer && chkSpeak.checked) {
                            oSpeechRecognizer.stop();
                        }

                        oSpeechSynthesisUtterance.lang = "en-US";
                        oSpeechSynthesisUtterance.text = s;
                        window.speechSynthesis.speak(oSpeechSynthesisUtterance);
                    }

                    function Mute(b) {
                        if (b) {
                            selVoices.style.display = "none";
                        } else {
                            selVoices.style.display = "";
                        }
                    }

                    function renderEmotion() {
                        var html = Emotions.map((emotion, index) => {
                            if (index == emotion.length - 1) {
                                return `<div class="col-md-12 mb-12">
                              <div class="card">
                                <div class="card-body">
                                  <h5 class="card-title">${emotion.title}</h5>
                                  <p class="card-text">${emotion.detail}</p>
                                </div>
                              </div>
                            </div>`
                            } else {
                                return `<div class="col-md-4 mb-4">
                              <div class="card">
                                <div class="card-body">
                                  <h5 class="card-title">${emotion.title}</h5>
                                  <p class="card-text">${emotion.detail}</p>
                                </div>
                              </div>
                            </div>`
                            }
                        })
                        document.getElementById('contentDetailEmotion').innerHTML = html.join('');
                    }

                    function renderQuestion() {
                        var html = Questions.split('\n').map((question, index) => {
                            return `<div class="col-md-12 mb-12 mt-3">
                              <div class="card" onclick="setActiveDiv(this,${index})">
                                <div class="card-body">
                                  <h5 class="card-title">${question}</h5>
                                </div>
                              </div>
                            </div>`
                        })
                        document.getElementById('contentQuestion').innerHTML = html.join('');
                    }

                    function renderSolution(data) {
                        var html = data.split("\n").map(item => `<p class="card-title mt-3">${item}</p>`);
                        document.getElementById('contentSolution').innerHTML = `<div class="col-md-12 mb-12 mt-3 p-5">
                              <div class="card">
                                <div class="card-body">
                    ${html.join('')}
                                </div>
                              </div>
                            </div>`;

                        html = Emotions.map(emotion =>
                                `<input type="hidden" name="emotionOfUserStory" value="${emotion.title}">`);
                        document.getElementById('formFinal').innerHTML = html.join("") + `<button class="form-control" type="submit">Finish Process</button>`
                    }

                    function SpeechToText() {
                        if (oSpeechRecognizer) {
                            if (chkSpeak.checked) {
                                oSpeechRecognizer.start();
                            } else {
                                oSpeechRecognizer.stop();
                            }

                            return;
                        }

                        oSpeechRecognizer = new webkitSpeechRecognition();
                        oSpeechRecognizer.continuous = true;
                        oSpeechRecognizer.interimResults = true;
                        oSpeechRecognizer.lang = "en-US";
                        oSpeechRecognizer.start();

                        oSpeechRecognizer.onresult = function (event) {
                            var interimTranscripts = "";
                            for (var i = event.resultIndex; i < event.results.length; i++) {
                                var transcript = event.results[i][0].transcript;

                                if (event.results[i].isFinal) {
                                    txtMsg.value = transcript;
                                    Send();
                                } else {
                                    transcript.replace("\n", "<br>");
                                    interimTranscripts += transcript;
                                }

                                var oDiv = document.getElementById("idText");
                                oDiv.innerHTML =
                                        '<span style="color: #999;">' + interimTranscripts + "</span>";
                            }
                        };

                        oSpeechRecognizer.onerror = function (event) { };
                    }
                </script>

                <!-- JavaScript Libraries -->
                <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="lib/wow/wow.min.js"></script>
                <script src="lib/easing/easing.min.js"></script>
                <script src="lib/waypoints/waypoints.min.js"></script>
                <script src="lib/owlcarousel/owl.carousel.min.js"></script>
                <script src="js/main.js"></script>
                </body>

                </html>
