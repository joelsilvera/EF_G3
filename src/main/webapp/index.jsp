<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="https://cdn-icons.flaticon.com/png/512/3223/premium/3223018.png?token=exp=1657648681~hmac=087611660cd778d1b2cee44987cb9493">
        <title>Login</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <style>
            video{
                position: fixed;
                min-width: 100%;
                min-height: 100%;
                z-index: -1;
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
            .gradient-custom-2 {
                /* fallback for old browsers */
                background: #fccb90;

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to right, #ee7724, #d8363a, #dd3675, #b44593);
            }

            @media (min-width: 768px) {
                .gradient-form {
                    height: 100vh !important;
                }
            }
            @media (min-width: 769px) {
                .gradient-custom-2 {
                    border-top-right-radius: .3rem;
                    border-bottom-right-radius: .3rem;
                }
            }
        </style>
    </head>
    <body>
        <video src="https://static.videezy.com/system/resources/previews/000/011/889/original/film_035_-_4K_res.mp4" autoplay="true" muted="true" loop="true" poster="https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2022/04/29/16512471939657.jpg"></video>
        <section class="h-100 gradient-form"">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-xl-10">
                        <div class="card rounded-3 text-black">
                            <div class="row g-0">
                                <div class="col-lg-6">
                                    <div class="card-body p-md-5 mx-md-4">

                                        <div class="text-center">
                                            <img src="https://d3t3ozftmdmh3i.cloudfront.net/production/podcast_uploaded400/6919275/6919275-1594322661766-7607d33b3a196.jpg"
                                                 style="width: 185px;" alt="logo">
                                            <h4 class="mt-1 mb-5 pb-1">TELE CAMPEON</h4>
                                        </div>

                                        <form method="post" action="<%=request.getContextPath()%>/LoginServlet">
                                            <p>Porfavor ingrese su cuenta</p>

                                            <div class="form-outline mb-4">
                                                <input type="email" id="form2Example11" class="form-control"
                                                       placeholder="Su nombre de usuario es su dni" />
                                                <label class="form-label" for="form2Example11">Nombre</label>
                                            </div>

                                            <div class="form-outline mb-4">
                                                <input type="password" id="form2Example22" class="form-control"
                                                       placeholder="dni-salario"/>
                                                <label class="form-label" for="form2Example22">Password</label>
                                            </div>
                                            <div class="text-center pt-1 mb-5 pb-1">
                                                <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="button">Ingresar</button>
                                            </div>
                                            <% if (request.getParameter("error")!=null){ %>
                                            <div class="form-outline mb4">Error en usuario o contraseña
                                            </div>
                                            <% } %>
                                        </form>

                                    </div>
                                </div>
                                <div class="col-lg-6 d-flex align-items-center gradient-custom-2">
                                    <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                                        <h4 class="mb-4">T3L3 C4MP30N FUTS4L S.A.C 2019</h4>
                                        <p class="small mb-0">Este sistema incluye reporte de todas sus películas, así como también visualizar la cartelera y la gestión de los empleados.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>