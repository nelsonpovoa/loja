<%@page import="com.example.teste3.models.Menu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.time.format.DateTimeFormatter"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<style>
body {
	margin: 0;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto",
		"Oxygen", "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans",
		"Helvetica Neue", sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

*:focus {
	outline: #04aa6d solid 2px;
}

code {
	font-family: source-code-pro, Menlo, Monaco, Consolas, "Courier New",
		monospace;
}

.close-button {
	background-color: transparent;
	cursor: pointer;
	border: none;
}

.logout_btn {
	border: none;
	background-color: transparent;
	font-family: Source Sans Pro;
	font-style: normal;
	font-weight: normal;
	font-size: 14px;
	line-height: 18px;
	color: #282a35;
}

.logout_btn:hover {
	color: #059963;
}

.grecaptcha-badge {
	bottom: 100px !important;
	z-index: 1001;
}

.suspense-spinner {
	position: fixed;
	top: 0px;
	left: 0px;
	width: 100vw;
	height: 100vh;
	z-index: 1500;
	display: flex;
	align-items: center;
	justify-content: center;
}
</style>


<link rel="stylesheet" href="/css/main.9bbebece.css" />


<style>
@import "./../../../../Style/base";

@import "./../../../../Style/form";

.input_wrapper {
	position: relative; . input_field_wrapper { position : relative; svg {
	position : absolute;
	bottom: 25px;
	right: 12px;
}

&
.error {svg { bottom:23px;
	
}

}
input {
	width: 100%;
}

}
}
.email_error {
	color: #d9212c;
	font-family: Source Sans Pro;
	font-style: normal;
	font-weight: normal;
	font-size: 13px;
}

.email_notice {
	color: #282a35;
	font-family: Source Sans Pro;
	font-style: normal;
	font-weight: normal;
	font-size: 13px;
}






.input_field {
    padding: 14px;
    margin: 6px 0;
    border-radius: 4px;
    border: 1px solid #ced4da;
    background-color: #fff;
    box-sizing: border-box;
    &:focus {
        box-shadow: 0px 0px 0px 3.2px rgba(0, 123, 255, 0.25);
        background-color: #fff;
        border: 1px solid #80bdff;
        outline: none;
    }

    &.invalid {
        border: 1px solid #d9212c;
        box-shadow: 0px 0px 0px 3.2px rgba(217, 33, 44, 0.25);
        border-radius: 4px;
    }
}

input[type="text"],
input[type="email"],
input[type="password"] {
    font-family: Source Sans Pro;
    font-size: 14px;
}

.input_wrapper {
    display: flex;
    font-family: Source Sans Pro;
    flex-direction: column;

    div.label_wrapper {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: flex-end;
        label {
            font-family: Source Sans Pro;
            font-weight: 600;
            font-size: 16px;
            margin: 30px 0 0 0;
            display: inline-block;
        }

        span {
            font-size: 14px;
            svg {
                display: inline-block;
                margin-right: 4px;
                position: relative;
                top: 2px;
            }

            span {
                color: #04aa6d;
                font-weight: 600;
                display: inline-block;
                margin-left: 6px;
                cursor: pointer;
            }
        }
    }
}


</style>



<div id="root">
	<div>
		<div class="">
			<div class="TopBarMenuLegacy2_top-bar-menu-ph__2SHQl"
				style="height: 73px;">&nbsp;</div>
			<div
				class="TopBarMenuLegacy2_topbarmenu__+jsDM TopBarMenuLegacy2_full_page__pVumg TopBarMenuLegacy2_fixed__nNiKz">
				<div
					class="TopBarMenuLegacy2_buttonbar__bp7RP LoginFullPage_buttonbar__XlWH-">
					<a class="TopBarMenuLegacy2_logo__08SSu"
						href="http://heroina.ddns.net" aria-label="W3Schools logo">
							Voltar à Loja
<!-- 						<svg -->
<!-- 							width="38" height="35" viewBox="0 0 38 35" fill="none" -->
<!-- 							xmlns="http://www.w3.org/2000/svg"> -->
<!-- 							<path -->
<!-- 								d="M31.3987 7.36607C31.3987 7.36607 32.3362 8.37054 33.6458 8.37054C34.68 8.37054 35.4315 7.74554 35.4315 6.88988C35.4315 5.84077 34.4716 5.35714 33.3109 5.35714H32.6264L32.2172 4.43452L34.0327 2.28423C34.4196 1.82292 34.7469 1.53274 34.7469 1.53274C34.7469 1.53274 34.4568 1.54762 33.869 1.54762H30.9151V0L36.9642 0V1.13095L34.5386 3.93601C35.9077 4.12946 37.2469 5.10417 37.2469 6.82292C37.2469 8.51191 35.9672 10.0744 33.7574 10.0744C31.6517 10.0744 30.4836 8.75 30.4836 8.75L31.3987 7.36607Z" -->
<!-- 								fill="#04AA6D"></path> -->
<!-- 							<path -->
<!-- 								d="M19.5981 9.45695L27.5892 23.6831L31.5326 16.6519L23.988 3.22183H15.2082L11.5698 9.70249L7.93146 3.22183H0.0371094L11.5252 23.6831L11.5698 23.6087L11.6145 23.6831L19.5981 9.45695Z" -->
<!-- 								fill="#04AA6D"></path> -->
<!-- 							<path -->
<!-- 								d="M0.118958 33.3257H1.28711C1.28711 33.668 1.58473 33.9954 2.11301 33.9954C2.60408 33.9954 2.93146 33.7498 2.93146 33.4224C2.93146 33.1397 2.71568 33.0132 2.34366 32.9314L1.67402 32.7602C0.543065 32.4626 0.252886 31.8599 0.252886 31.2201C0.252886 30.4388 1.0267 29.7245 2.12045 29.7245C3.0133 29.7245 4.02521 30.1784 4.01033 31.2945H2.82729C2.82729 30.9522 2.51479 30.7364 2.15765 30.7364C1.77074 30.7364 1.50289 30.9596 1.50289 31.2721C1.50289 31.5326 1.74842 31.6814 2.0386 31.7483L2.84217 31.9641C3.97312 32.2543 4.17402 32.9611 4.17402 33.4224C4.17402 34.4418 3.15467 34.9998 2.13533 34.9998C1.14574 34.9998 0.141279 34.3971 0.118958 33.3257Z" -->
<!-- 								fill="#04AA6D"></path> -->
<!-- 							<path -->
<!-- 								d="M5.20837 32.3584C5.20837 30.7662 6.48814 29.7245 7.93903 29.7245C8.80956 29.7245 9.51641 30.1114 9.97772 30.6918L9.09974 31.3912C8.83933 31.0787 8.41522 30.8852 7.96135 30.8852C7.09081 30.8852 6.46581 31.5102 6.46581 32.3584C6.46581 33.1992 7.09081 33.8391 7.96135 33.8391C8.41522 33.8391 8.83933 33.6457 9.09974 33.3332L9.97772 34.0326C9.51641 34.6129 8.80956 34.9998 7.93903 34.9998C6.48814 34.9998 5.20837 33.9507 5.20837 32.3584Z" -->
<!-- 								fill="#04AA6D"></path> -->
<!-- 							<path -->
<!-- 								d="M15.9895 32.0535V34.866H14.7395V32.1428C14.7395 31.3392 14.2559 30.9077 13.6979 30.9077C13.1249 30.9077 12.4181 31.2425 12.4181 32.2172V34.8735H11.1681V27.1205H12.4255V30.6101C12.6711 29.9999 13.4821 29.7172 13.9806 29.7172C15.2752 29.7246 15.9895 30.5952 15.9895 32.0535Z" -->
<!-- 								fill="#04AA6D"></path> -->
<!-- 							<path -->
<!-- 								d="M17.299 32.3584C17.299 30.7662 18.5341 29.7245 19.9626 29.7245C21.3912 29.7245 22.6412 30.7662 22.6412 32.3584C22.6412 33.9507 21.3912 34.9998 19.9626 34.9998C18.5341 34.9998 17.299 33.9507 17.299 32.3584ZM21.3838 32.3584C21.3838 31.4954 20.7364 30.8852 19.9626 30.8852C19.1888 30.8852 18.5564 31.4954 18.5564 32.3584C18.5564 33.2364 19.1888 33.8391 19.9626 33.8391C20.7364 33.8391 21.3838 33.2364 21.3838 32.3584Z" -->
<!-- 								fill="#04AA6D"></path> -->
<!-- 							<path -->
<!-- 								d="M23.7053 32.3584C23.7053 30.7662 24.9404 29.7245 26.369 29.7245C27.7975 29.7245 29.0475 30.7662 29.0475 32.3584C29.0475 33.9507 27.7975 34.9998 26.369 34.9998C24.9478 34.9998 23.7053 33.9507 23.7053 32.3584ZM27.7901 32.3584C27.7901 31.4954 27.1428 30.8852 26.369 30.8852C25.5951 30.8852 24.9627 31.4954 24.9627 32.3584C24.9627 33.2364 25.5951 33.8391 26.369 33.8391C27.1502 33.8391 27.7901 33.2364 27.7901 32.3584Z" -->
<!-- 								fill="#04AA6D"></path> -->
<!-- 							<path d="M30.4314 34.8735V27.1205H31.6814V34.8735H30.4314Z" -->
<!-- 								fill="#04AA6D"></path> -->
<!-- 							<path -->
<!-- 								d="M33.0431 33.3257H34.2112C34.2112 33.668 34.5089 33.9954 35.0371 33.9954C35.5282 33.9954 35.8556 33.7498 35.8556 33.4224C35.8556 33.1397 35.6398 33.0132 35.2678 32.9314L34.5982 32.7602C33.4672 32.4626 33.177 31.8599 33.177 31.2201C33.177 30.4388 33.9508 29.7245 35.0446 29.7245C35.9374 29.7245 36.9493 30.1784 36.9345 31.2945H35.744C35.744 30.9522 35.4315 30.7364 35.0743 30.7364C34.6874 30.7364 34.4196 30.9596 34.4196 31.2721C34.4196 31.5326 34.6651 31.6814 34.9553 31.7483L35.7589 31.9641C36.8898 32.2543 37.0907 32.9611 37.0907 33.4224C37.0907 34.4418 36.0714 34.9998 35.052 34.9998C34.0624 34.9998 33.0654 34.3971 33.0431 33.3257Z" -->
<!-- 								fill="#04AA6D"></path> -->
<!-- 							<defs></defs></svg> -->
							
							
							</a>
					<nav class="" id="navigation">
						<div class="TopBarMenuLegacy2_end_wrapper__6DlWq">
							<div class=" TopBarMenuLegacy2_user_profile_button__Qv+Te">
								<button title="Close">
									<svg width="50px" height="50px" viewBox="0 0 30 30" fill="none"
										xmlns="http://www.w3.org/2000/svg">
										<path
											d="M8.71146 8.71146C8.79855 8.62415 8.902 8.55489 9.0159 8.50762C9.12979 8.46036 9.2519 8.43604 9.37521 8.43604C9.49852 8.43604 9.62063 8.46036 9.73452 8.50762C9.84842 8.55489 9.95188 8.62415 10.039 8.71146L15.0002 13.6746L19.9615 8.71146C20.0486 8.6243 20.1521 8.55515 20.266 8.50798C20.3799 8.46081 20.5019 8.43653 20.6252 8.43653C20.7485 8.43653 20.8705 8.46081 20.9844 8.50798C21.0983 8.55515 21.2018 8.6243 21.289 8.71146C21.3761 8.79863 21.4453 8.9021 21.4924 9.01599C21.5396 9.12988 21.5639 9.25194 21.5639 9.37521C21.5639 9.49848 21.5396 9.62054 21.4924 9.73443C21.4453 9.84832 21.3761 9.9518 21.289 10.039L16.3258 15.0002L21.289 19.9615C21.3761 20.0486 21.4453 20.1521 21.4924 20.266C21.5396 20.3799 21.5639 20.5019 21.5639 20.6252C21.5639 20.7485 21.5396 20.8705 21.4924 20.9844C21.4453 21.0983 21.3761 21.2018 21.289 21.289C21.2018 21.3761 21.0983 21.4453 20.9844 21.4924C20.8705 21.5396 20.7485 21.5639 20.6252 21.5639C20.5019 21.5639 20.3799 21.5396 20.266 21.4924C20.1521 21.4453 20.0486 21.3761 19.9615 21.289L15.0002 16.3258L10.039 21.289C9.9518 21.3761 9.84832 21.4453 9.73443 21.4924C9.62054 21.5396 9.49848 21.5639 9.37521 21.5639C9.25194 21.5639 9.12988 21.5396 9.01599 21.4924C8.9021 21.4453 8.79863 21.3761 8.71146 21.289C8.6243 21.2018 8.55515 21.0983 8.50798 20.9844C8.46081 20.8705 8.43653 20.7485 8.43653 20.6252C8.43653 20.5019 8.46081 20.3799 8.50798 20.266C8.55515 20.1521 8.6243 20.0486 8.71146 19.9615L13.6746 15.0002L8.71146 10.039C8.62415 9.95188 8.55489 9.84842 8.50762 9.73452C8.46036 9.62063 8.43604 9.49852 8.43604 9.37521C8.43604 9.2519 8.46036 9.12979 8.50762 9.0159C8.55489 8.902 8.62415 8.79855 8.71146 8.71146Z"
											fill="#282A35" fill-opacity="0.6"></path></svg>
								</button>
							</div>
						</div>
					</nav>
				</div>
			</div>
			<div class="LoadingModal_modal__0cMI5  LoadingModal_full_page__8c50F">
				<div
					class="LoadingModal_modal_inner__yRnR+ LoadingModal_full_page__8c50F">
					<h1>Loading...</h1>
					<div class="LoadingModal_spinner__QgquP" aria-label="Please wait"
						role="status" aria-live="polite"></div>
					<p></p>
				</div>
			</div>
			<div>
				<div
					class="LoginModal_modal__1Yybs LoginModal_show__F6L8A LoginModal_full_page__PoJE0">
					<div class="LoginModal_modal_inner__zNxJo ">
						<div>
							<h1 class="">Autenticação</h1>
						</div>
						<svg width="30px" height="30px" viewBox="0 0 30 30"
							class="LoginModal_close_button__a1rH0 LoginModal_full_page__PoJE0"
							fill="none" xmlns="http://www.w3.org/2000/svg">
							<path
								d="M8.71146 8.71146C8.79855 8.62415 8.902 8.55489 9.0159 8.50762C9.12979 8.46036 9.2519 8.43604 9.37521 8.43604C9.49852 8.43604 9.62063 8.46036 9.73452 8.50762C9.84842 8.55489 9.95188 8.62415 10.039 8.71146L15.0002 13.6746L19.9615 8.71146C20.0486 8.6243 20.1521 8.55515 20.266 8.50798C20.3799 8.46081 20.5019 8.43653 20.6252 8.43653C20.7485 8.43653 20.8705 8.46081 20.9844 8.50798C21.0983 8.55515 21.2018 8.6243 21.289 8.71146C21.3761 8.79863 21.4453 8.9021 21.4924 9.01599C21.5396 9.12988 21.5639 9.25194 21.5639 9.37521C21.5639 9.49848 21.5396 9.62054 21.4924 9.73443C21.4453 9.84832 21.3761 9.9518 21.289 10.039L16.3258 15.0002L21.289 19.9615C21.3761 20.0486 21.4453 20.1521 21.4924 20.266C21.5396 20.3799 21.5639 20.5019 21.5639 20.6252C21.5639 20.7485 21.5396 20.8705 21.4924 20.9844C21.4453 21.0983 21.3761 21.2018 21.289 21.289C21.2018 21.3761 21.0983 21.4453 20.9844 21.4924C20.8705 21.5396 20.7485 21.5639 20.6252 21.5639C20.5019 21.5639 20.3799 21.5396 20.266 21.4924C20.1521 21.4453 20.0486 21.3761 19.9615 21.289L15.0002 16.3258L10.039 21.289C9.9518 21.3761 9.84832 21.4453 9.73443 21.4924C9.62054 21.5396 9.49848 21.5639 9.37521 21.5639C9.25194 21.5639 9.12988 21.5396 9.01599 21.4924C8.9021 21.4453 8.79863 21.3761 8.71146 21.289C8.6243 21.2018 8.55515 21.0983 8.50798 20.9844C8.46081 20.8705 8.43653 20.7485 8.43653 20.6252C8.43653 20.5019 8.46081 20.3799 8.50798 20.266C8.55515 20.1521 8.6243 20.0486 8.71146 19.9615L13.6746 15.0002L8.71146 10.039C8.62415 9.95188 8.55489 9.84842 8.50762 9.73452C8.46036 9.62063 8.43604 9.49852 8.43604 9.37521C8.43604 9.2519 8.46036 9.12979 8.50762 9.0159C8.55489 8.902 8.62415 8.79855 8.71146 8.71146Z"
								fill="#282A35" fill-opacity="0.6"></path></svg>
						<div>
							<form>
								<div class="EmailInput_input_wrapper__taDTk -fif_wrp">
									<div class="EmailInput_label_wrapper__83g-2 -fif_label_wrp">
										<label for="email">Email</label><span>Nova Conta? <span>
												Criar</span>
										</span>
									</div>
									<div
										class="EmailInput_input_field_wrapper__eWcDI -fif_input_wrp ">
										<input class="EmailInput_input_field__6t4Ux undefined"
											type="text" name="email" placeholder="" id="modalusername"
											autocapitalize="none" autocorrect="false" value="">
									</div>
								</div>
								<div class="PasswordInput_input_wrapper__uSskp -fif_wrp">
									<div class="PasswordInput_label_wrapper__nvF4r -fif_label_wrp">
										<label for="current-password">Password</label><span
											class="PasswordInput_show_pwd_btn__Ncc9S"><svg
												aria-hidden="true" focusable="false" data-prefix="far"
												data-icon="eye" role="img"
												xmlns="http://www.w3.org/2000/svg" width="15" height="14"
												viewBox="0 0 640 512" class="svg-inline--fa fa-eye fa-w-18">
												<path fill="currentColor"
													d="M288 144a110.94 110.94 0 0 0-31.24 5 55.4 55.4 0 0 1 7.24 27 56 56 0 0 1-56 56 55.4 55.4 0 0 1-27-7.24A111.71 111.71 0 1 0 288 144zm284.52 97.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400c-98.65 0-189.09-55-237.93-144C98.91 167 189.34 112 288 112s189.09 55 237.93 144C477.1 345 386.66 400 288 400z"></path></svg>Mostrar
										</span>
									</div>
									<div class="-fif_input_wrp">
										<input class="PasswordInput_input_field__EWMIU undefined"
											name="current-password" type="password" placeholder=""
											id="current-password" value="">
									</div>
								</div>
							</form>
						</div>
						<div style="height: 20px;"></div>
						<div class="LoginModal_cta_bottom_box__wU1AF">
							<div class="LoginModal_cta_bottom_box_button_login__5Fbwv">
								<button
									class="Button_button__URNp+ Button_primary__d2Jt3 Button_fullwidth__0HLEu">
									<span>Entrar</span>
								</button>
							</div>
							<div>
								<div class="LoginModal_cta_bottom_box_divider__jEfL3">
									<span class="LoginModal_cta_bottom_box_divider_text__wyauO">ou</span>
								</div>
								<div>
									<button
										class="ButtonV2_button_wrapper__Tb921 ButtonV2_btn_green__UfRit LoginModal_cta_bottom_box_button_facebook_login__RyzBN">
										<div class="ButtonV2_icon__KUVAy">
											<svg role="img" height="24" width="24" aria-hidden="true"
												fill="white" viewBox="0 0 24 24" data-encore-id="icon">
												<path
													d="M22 12c0-5.523-4.477-10-10-10S2 6.477 2 12c0 4.991 3.657 9.128 8.438 9.878v-6.987h-2.54V12h2.54V9.797c0-2.506 1.492-3.89 3.777-3.89 1.093 0 2.238.195 2.238.195v2.46h-1.26c-1.243 0-1.63.771-1.63 1.563V12h2.773l-.443 2.89h-2.33v6.988C18.343 21.128 22 16.991 22 12z"></path></svg>
										</div>
										<div class="ButtonV2_text__hrU4c">Entrar com Facebook</div>
									</button>
								</div>
								<button
									class="ButtonV2_button_wrapper__Tb921 ButtonV2_btn_green__UfRit LoginModal_cta_bottom_box_button_google_login__qKvO2">
									<div class="ButtonV2_icon__KUVAy">
										<svg role="img" height="24" width="24"
											xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink"
											viewBox="0 0 48 48">
											<defs>
											<path id="a"
												d="M44.5 20H24v8.5h11.8C34.7 33.9 30.1 37 24 37c-7.2 0-13-5.8-13-13s5.8-13 13-13c3.1 0 5.9 1.1 8.1 2.9l6.4-6.4C34.6 4.1 29.6 2 24 2 11.8 2 2 11.8 2 24s9.8 22 22 22c11 0 21-8 21-22 0-1.3-.2-2.7-.5-4z"></path></defs>
											<clipPath id="b">
											<use xlink:href="#a" overflow="visible"></use></clipPath>
											<path clip-path="url(#b)" fill="#FBBC05" d="M0 37V11l17 13z"></path>
											<path clip-path="url(#b)" fill="#EA4335"
												d="M0 11l17 13 7-6.1L48 14V0H0z"></path>
											<path clip-path="url(#b)" fill="#34A853"
												d="M0 37l30-23 7.9 1L48 0v48H0z"></path>
											<path clip-path="url(#b)" fill="#4285F4"
												d="M48 48L17 24l-4-3 35-10z"></path></svg>
									</div>
									<div
										class="ButtonV2_text__hrU4c LoginModal_cta_bottom_box_button_google_login_text__25VDY">Entrar
										com Google</div>
								</button>
								<!-- 								<button -->
								<!-- 									class="ButtonV2_button_wrapper__Tb921 ButtonV2_btn_green__UfRit LoginModal_cta_bottom_box_button_github_login__TClZC"> -->
								<!-- 									<div class="ButtonV2_icon__KUVAy"> -->
								<!-- 										<svg height="24" aria-hidden="true" viewBox="0 0 16 16" -->
								<!-- 											width="24"> -->
								<!-- 											<path -->
								<!-- 												d="M8 0c4.42 0 8 3.58 8 8a8.013 8.013 0 0 1-5.45 7.59c-.4.08-.55-.17-.55-.38 0-.27.01-1.13.01-2.2 0-.75-.25-1.23-.54-1.48 1.78-.2 3.65-.88 3.65-3.95 0-.88-.31-1.59-.82-2.15.08-.2.36-1.02-.08-2.12 0 0-.67-.22-2.2.82-.64-.18-1.32-.27-2-.27-.68 0-1.36.09-2 .27-1.53-1.03-2.2-.82-2.2-.82-.44 1.1-.16 1.92-.08 2.12-.51.56-.82 1.28-.82 2.15 0 3.06 1.86 3.75 3.64 3.95-.23.2-.44.55-.51 1.07-.46.21-1.61.55-2.33-.66-.15-.24-.6-.83-1.23-.82-.67.01-.27.38.01.53.34.19.73.9.82 1.13.16.45.68 1.31 2.69.94 0 .67.01 1.3.01 1.49 0 .21-.15.45-.55.38A7.995 7.995 0 0 1 0 8c0-4.42 3.58-8 8-8Z"></path></svg> -->
								<!-- 									</div> -->
								<!-- 									<div -->
								<!-- 										class="ButtonV2_text__hrU4c LoginModal_cta_bottom_box_button_github_login_text__PwnFI">Continue -->
								<!-- 										with GitHub</div> -->
								<!-- 								</button> -->
								<!-- 								<button -->
								<!-- 									class="ButtonV2_button_wrapper__Tb921 ButtonV2_btn_green__UfRit LoginModal_cta_bottom_box_button_feide_login__rISrj"> -->
								<!-- 									<div class="ButtonV2_icon__KUVAy"> -->
								<!-- 										<svg id="Layer_1" role="img" data-name="Layer 1" -->
								<!-- 											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32 38" -->
								<!-- 											width="24" height="24" class="LoginModal_feide_icon__Yu0E+"> -->
								<!-- 											<defs></defs> -->
								<!-- 											<title>Horisontal_Feide</title><rect class="cls-1" x="27.99" -->
								<!-- 												y="20.34" width="4.24" height="10.18"></rect> -->
								<!-- 											<polygon class="cls-1" -->
								<!-- 												points="18.23 23.31 13.99 23.31 13.99 34.76 4.24 34.76 4.24 20.34 0 20.34 0 35.61 0.02 35.61 0.02 39 32.23 39 32.23 34.76 18.23 34.76 18.23 23.31"></polygon> -->
								<%-- 											<circle class="cls-1" cx="16.11" cy="16.53" r="2.54"></circle> --%>
								<!-- 											<path class="cls-1" -->
								<!-- 												d="M16.11,4.24A11.87,11.87,0,0,1,28,16.1h4.25A16.11,16.11,0,0,0,0,16.1H4.25A11.87,11.87,0,0,1,16.11,4.24Z"></path></svg> -->
								<!-- 									</div> -->
								<!-- 									<div -->
								<!-- 										class="ButtonV2_text__hrU4c LoginModal_cta_bottom_box_button_github_login_text__PwnFI">Continue -->
								<!-- 										with Feide</div> -->
								<!-- 								</button> -->
							</div>
							<div class="LoginModal_forgot_pwd_wrapper__qttSX">
								<a href="https://profile.w3schools.com/reset">Recuperar
									password?</a>
							</div>
						</div>
					</div>
				</div>
				<div>
					<div>
<!-- 						<div class="grecaptcha-badge" data-style="bottomright" -->
<!-- 							style="width: 256px; height: 60px; display: block; transition: right 0.3s ease 0s; position: fixed; bottom: 14px; right: -186px; box-shadow: gray 0px 0px 5px; border-radius: 2px; overflow: hidden;"> -->
<!-- 							<div class="grecaptcha-logo"> -->
<!-- 								<iframe title="reCAPTCHA" width="256" height="60" -->
<!-- 									role="presentation" name="a-8jd398b4ozgz" frameborder="0" -->
<!-- 									scrolling="no" -->
<!-- 									sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox allow-storage-access-by-user-activation" -->
<!-- 									src="https://www.google.com/recaptcha/api2/anchor?ar=1&amp;k=6Lcw4wscAAAAAHwbESe78xTTKjnQfqe-b6LEkVBk&amp;co=aHR0cHM6Ly9wcm9maWxlLnczc2Nob29scy5jb206NDQz&amp;hl=pt-PT&amp;type=image&amp;v=u-xcq3POCWFlCr3x8_IPxgPu&amp;theme=light&amp;size=invisible&amp;badge=bottomright&amp;cb=2pmit46xle4i"></iframe> -->
<!-- 							</div> -->
<!-- 							<div class="grecaptcha-error"></div> -->
<!-- 							<textarea id="g-recaptcha-response" name="g-recaptcha-response" -->
<!-- 								class="g-recaptcha-response" -->
<!-- 								style="width: 250px; height: 40px; border: 1px solid rgb(193, 193, 193); margin: 10px 25px; padding: 0px; resize: none; display: none;"></textarea> -->
<!-- 						</div> -->
						<iframe style="display: none;"></iframe>
					</div>
				</div>
				<div
					class="TermsFooter_terms_footer__9tugK LoginModal_footer__8eZo7"
					style="position: absolute;" role="contentinfo">

					<span>Copyright &copy; Website 2023</span>


					<!-- 					© 1999 - 2023 <a href="http://w3schools.com/" target="_blank" -->
					<!-- 						rel="noopener noreferrer">W3schools</a>. All rights reserved. <a -->
					<!-- 						href="https://www.w3schools.com/about/about_privacy.asp" -->
					<!-- 						target="_blank" rel="noopener noreferrer">Cookie policy</a>, <a -->
					<!-- 						href="https://www.w3schools.com/about/about_privacy.asp" -->
					<!-- 						target="_blank" rel="noopener noreferrer">Privacy</a> and <a -->
					<!-- 						href="https://www.w3schools.com/about/about_copyright.asp" -->
					<!-- 						target="_blank" rel="noopener noreferrer">Terms</a>. -->
				</div>
			</div>
		</div>
	</div>
</div>


<div>
	<iframe title="Opens a widget where you can find more information"
		id="launcher" tabindex="0" src="login7-iframe.html"
		style="border:1px solid blue;color-scheme: light; width: 107px; height: 50px; padding: 0px; margin: 10px 20px; position: fixed; bottom: 0px; overflow: visible; opacity: 1; border: 0px; z-index: 999998; transition-duration: 250ms; transition-timing-function: cubic-bezier(0.645, 0.045, 0.355, 1); transition-property: opacity, top, bottom; right: 0px;">

		
	</iframe>
	
				
</div>




