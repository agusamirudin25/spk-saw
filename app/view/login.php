<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<!-- BEGIN: Head-->

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Integrasi kmeans clustering dan sistem informasi geografis daerah rawan bencana alam.">
    <meta name="keywords" content="kmeans bencana alam, karawang, stmik horizon karawang">
    <meta name="author" content="Agus Amirudin">
    <title><?= $title ?></title>
    <link rel="shortcut icon" href="<?= asset() ?>assets/images/kharisma.png">
    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,500,600%7CIBM+Plex+Sans:300,400,500,600,700" rel="stylesheet">

    <!-- BEGIN: Vendor CSS-->
    <link rel="stylesheet" type="text/css" href="<?= asset() ?>assets/login/vendors/css/vendors.min.css">
    <!-- END: Vendor CSS-->

    <!-- BEGIN: Theme CSS-->
    <link rel="stylesheet" type="text/css" href="<?= asset() ?>assets/login/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="<?= asset() ?>assets/login/css/bootstrap-extended.css">
    <link rel="stylesheet" type="text/css" href="<?= asset() ?>assets/login/css/colors.css">
    <link rel="stylesheet" type="text/css" href="<?= asset() ?>assets/login/css/components.css">
    <!-- END: Theme CSS-->

    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="<?= asset() ?>assets/login/css/authentication.css">
    <!-- END: Page CSS-->


</head>
<!-- END: Head-->

<!-- BEGIN: Body-->

<body class="vertical-layout vertical-menu-modern 1-column  navbar-sticky footer-static bg-full-screen-image  blank-page blank-page" data-open="click" data-menu="vertical-menu-modern" data-col="1-column">
    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="content-wrapper">
            <div class="content-header row">
            </div>
            <div class="content-body">
                <!-- login page start -->
                <section id="auth-login" class="row flexbox-container">
                    <div class="col-xl-8 col-11">
                        <div class="card bg-authentication mb-0">
                            <div class="row m-0">
                                <!-- left section-login -->
                                <div class="col-md-6 col-12 px-0">
                                    <div class="card disable-rounded-right mb-0 p-2 h-100 d-flex justify-content-center">
                                        <div class="card-header pb-1">
                                            <div class="card-title">
                                                <h4 class="text-center mb-2">Selamat Datang</h4>
                                            </div>
                                        </div>
                                        <div class="card-content">
                                            <div class="card-body">
                                                <form method="post" id="formLogin" autocomplete="off">
                                                    <div class="form-group mb-50">
                                                        <label class="text-bold-600" for="nama_pengguna">Nama
                                                            Pengguna</label>
                                                        <input type="text" required class="form-control" id="nama_pengguna" placeholder="Nama Pengguna..." name="nama_pengguna">
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="text-bold-600" for="katasandi">Katasandi</label>
                                                        <input type="password" class="form-control" id="katasandi" name="katasandi" placeholder="Katasandi" required>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary glow w-100 position-relative">Login<i id="icon-arrow" class="bx bx-right-arrow-alt"></i></button>
                                                </form>
                                                <hr>
                                                <div class="text-center"><small class="mr-25">STMIK HORIZON
                                                        KARAWANG</small>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- right section image -->
                                <div class="col-md-6 d-md-block d-none text-center align-self-center p-3">
                                    <div class="card-content">
                                        <img class="img-fluid" src="<?= asset() ?>assets/login/images/pages/login-new.png" alt="branding logo">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- login page ends -->

            </div>
        </div>
    </div>
    <!-- END: Content-->


    <script src="<?= asset() ?>assets/login/vendors/js/vendors.min.js"></script>
    <script src="<?= asset() ?>assets/login/js/scripts/components.js"></script>
    <script src="<?= asset() ?>assets/login/js/scripts/footer.js"></script>
    <script src="<?= asset() ?>assets/js/sweetalert2.min.js"></script>

    <!-- App js -->
    <script>
        $('#formLogin').submit(function(e) {
            e.preventDefault()
            login_process()
        });
        $("#nama_pengguna").keyup(function(event) {
            $("#nama_pengguna").val($('#nama_pengguna').val().replace(/['"]/g, ''));
            if (event.keyCode == 13) {
                login_process();
            }
        });
        $("#katasandi").keyup(function(event) {
            $("#katasandi").val($('#katasandi').val().replace(/['"]/g, ''));
            if (event.keyCode == 13) {
                login_process();
            }
        });

        function login_process() {
            let user = $('#nama_pengguna').val();
            let pass = $('#katasandi').val();
            if (user.length == 0) {
                error_alert('Error', 'Nama pengguna tidak boleh kosong')
                $("#nama_pengguna").focus();
                return false;
            }
            if (pass.length == 0) {
                $("#katasandi").focus();
                error_alert('Error', 'Katasandi tidak boleh kosong')
                return false;
            }
            $.ajax({
                url: '<?= url() ?>Auth/cek_login',
                type: 'POST',
                data: new FormData(document.getElementById("formLogin")),
                processData: false,
                contentType: false,
                cache: false,
                async: false,
                dataType: "json",
                success: function(data) {
                    if (data.login_status == 1) {
                        success_alert("Berhasil", data.msg, data.page);
                    } else {
                        error_alert("Gagal", data.msg);
                    }
                }
            });

        }
    </script>
    <script>
        function success_alert(title, msg, page) {
            Swal.fire({
                icon: 'success',
                title: title,
                text: msg,
                timer: 1500,
                footer: '',
                showCancelButton: false,
                showConfirmButton: false
            }).then(function() {
                window.location = "<?= url() ?>" + page;
            })
        }

        function error_alert(title, msg) {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: msg,
                footer: ''
            })
        }
    </script>

</body>
<!-- END: Body-->

</html>