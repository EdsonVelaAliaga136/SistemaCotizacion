<%@include file="header.jsp" %>
<div id="colorlib-page">
    <a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
    <aside id="colorlib-aside" role="complementary" class="js-fullheight">
        <nav id="colorlib-main-menu" role="navigation">
            <ul>
                <li class="colorlib-active"><a href="#">Home</a></li>
                <li><a href="listarEmpleado.jsp">Listar Empleado</a></li>
                <li><a href="registrarEmpleado.jsp">Registrar Empleado</a></li>
                <li><a href="buscarEmpleado.jsp">Buscar Empleado</a></li>
            </ul>
        </nav>
    </aside> <!-- END COLORLIB-ASIDE -->

    <div id="colorlib-main">
        <section class="ftco-section pt-4 mb-5 ftco-intro">
            <div class="container-fluid px-3 px-md-0">
                <div class="row">
                    <div class="col-md-12 mb-4">
                        <h1 class="h2">Sistema de Cotizaciones</h1>
                        <p>El sistema web se encarga de cotizar los proyectos que se que se soliciten, 
                            calculando el precio total que de cada actividad que se requiera para realizar dicho proyecto. 
                            Cada actividad tiene varias sub actividades los cuales a su vez  tienen información de:<br>
                            *	Materiales.<br>
                            *	Mano de obra.<br>
                            *	Equipos, maquinaria y herramientas.<br>

                            El sistema será capaz de calcular a partir de las actividades el costo que tendrá el proyecto, de manera que tendra cade detalle de los costos que requerira la mano de obra, los materiales que se utilizara y la maquinaria o equipo.
                        </p>
                    </div>
                    <div class="col-md-6">
                        <h2 class="h4">Aquasoft SRL</h2>
                        <p><img class="img img-fluid" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAABj1BMVEX////sVwfrVgZSVllOUVT6+voOFBg3Ojw9QEJBRUdGSUxJTU8Eqrb1WADuZyX//f/6///8//3/+v/5//v/+P///fr5/f/+//n1///vZiPlYiz038LpZiX/+Pn5/vgAq7XxgVMAoar/+vLklm7otYcgnrYCqbn/8ucAoagAoa/u///4//TY+/xnxsgAqa0Kpbj1ZBz/++raaDDyYi3K8/ZwwMfW//+q3N6u4ef75NLlhlb+8d7qZRrp9/vK6eut2tq81dJFwrkuq6Jju7TP5+Ww7e285/BTyMs4qqnqvpbyjmjmgEf1up3E+PVNucL23cbinoHdckjdaSLWflbx06j8XSTYai6L4N70yLDefVTpb1mT1d3yVy/YdzvgqYiW5eHt0MDitJ3PeUnsoHvmaj/wmGD4z8v4ypb7xJ1VrryAz9z05N7MiWZEssN2tLjpfl7w5cTcbxfvqpzhq2j22aSGx9znhjvKgD/Ig2b4xrnmzLTXj14akKbrl4h4uszijnLj0Mea6/TXqI/craT0v4aXnjCeAAASFElEQVR4nO2aiV/bZprH1ZnV7uyul/eV5PfwIbmS8SHJyAd2sLBNtmxJoBAMhhJlvEACSScJzSSZ3ZlOkm7TdOcP3+eVSQZSCEyOpXje3yeFYuv66rlfSVGkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpKSkpMZFmoZ0XUdCWEiB/zTQRV/Xx1NMiCjFlCqK4Iw/GydCRdjOMAyM9KRJGIutiQi56Mv6eAKjYW5ojGmYc8Oyxo9QEU6pmqbvaxR8FTAxfGKMk5diTRG5hmDa683NXf33HmQa8NqLvqyPKoQo9yrtqS/m5//j6pe9cbIhEh6q6DquLEwlgnJ56kYPgZMSpyTkQDBiQXpJE6tmEGISzbCYrl+7HrjVYPFqhSeTOqlnlva/+nx5Nr8SEgxfI8vH6KIv972EgM9ASX5jqhzkqtXVGxhqolXvr62ns4NBN5ttbKyEdYsi4jB80Rf7HoKSwAxP05PtL+aDXMINmlTVde5vbtyd/jo1GAyyqYns1r2Mg2nSdPxL6KhIBwsq2BvawoC54CbV1aTJouV0NlWr1SayE/Cz1r0V1Q09SazLSEi5YSa9m+VcolpIlFcrxKC6E/7269rEAOhSE4IzNTG9vlQ3KFIv+nLfQ0Co6b1hECSq1WJQvqZonCudtf+cToF3ZrMT8At+p7+ubS/VMb2MmQb6UB0sWEwkisXc/GIPaYhq/fVUNpuaFoyCT6ibakSOwS76ct9DGCXpwnyuWswlirlgyoO6iNhKoyvYUhPdEd9EatD9evpWvx5nmk/ZrB6puR/rLFxNVr6AHFPM5YpF+6YYnUh9p1E7JAMfjVVLZSeyyyE2CNwApn0ab4XmX9MIQpoG86lCPlLnj1U8LBerxYQgDHahOCqKA4Sv0Y4QpgYrDoPywpjyiQjFWAr/fF+cAsZVsOlHOCq+smhXq0FuRAiToYJJBIRCfyWEkEzVsht9+BZrn45QUGEKccAYM7Aw6YcjIpFmCtUAEItusMugb+FKOJsaEYpofANZSzX2HUH4qeKQCCvGoUjhJKIdFogffLbmYg6cNLZhNbjJhQ1paaUhYjCVeosw2wgJFJPRGsdHF7QemBKnk8l0GKd6UldjxA8lhCjMQRAmRBxWy1MeFkMU6aw1oKc5Rhj7bBcqBkc6+jT9qYa5UX+eX25shCrHxHHAisoHRwRftRPFIBCRWK0mypX4+jHpzzbeJgSXTdXWStanI0QUs/6L9Ge1W6Fp3l6KBKLy/v4iHJ4o2hXXhQyTG1WLojv0sGHqlDr9fHqim52enk51RyknDsruRgZGKBBAwsClKAwSOxKJHZhVSBBw1w2YVIQfQ2WJN4RkBn8ZBsQXJA+xYAn5BKIMviUGh46DaKPNLUjkWrSV+nz/TscpfdXdKwkj4vdGBEJGCF+oFqGfGbkp+OmjJjeIKipRuA+xCIQT3SNJNbW+6VOoV6qBueX7UDuhjYUfqgpXahKfwd2xfE2svAITgVslrp8KFstixAJCgajGirmxrmvQDY5WZx0F3RkMImIySxDWYXtxuz6McAg2fEOYKLpTnm75lqInWX3n7nQ3Lvzp6TeMd5eYqMiabyZ1OLkOkxYC81iccxgqfYMmkyZB1IMLV+EUnGti2Y4DA9hNrFFCo28w3zc4N5iwIjMMThUGp0wmqYacncEgo+mUd/KNvY4DTfP7F30gJEjxWrEJBWGMmLCHFc0XVuBGaWV90AVXTafTrwlT6R0HbrqmWb259u5uu+npSRMMwSszw2GzMrew0NNVPtdu94StenMzTQ6E2JtrD4ftHkSwzj2/Hj57thJF/ToDizK/Xnr27E6U6RBKsdm/l01Pbn6TrP9uObt1/xnhisnetySCJSC0vZabeK1cbEUbelMLJTWqI39zVgyJ2TT03YeE0/l63FXNtRJ2MB8s7npASOm1B3a57D58uLjYxtwblsswRyPcfFBucURps5UrB0F5dVhJJrnhRC9/C14xmN3P1HWd1DfzDbiHy/tPfBUdfJvtZrcGG6XM01q3O7gVgpto75/WoMnGXitxRIIwUW41laTqEx3zev+rNIyH2b8S1l7EhF6rbIsqGpR3qQnT16Oq61YLhaIdzFBDEC5wQ8M3ynaLJ/Xe78s23EfXTQy5ztk3jwdCkJn3nmiYZbZTT59ma7XBiycOOfh2UMs2Bi86mcY0bHIrhFDHH0CI3iaMq6Jrr17zeJzFTNbfB8QulP/jhHzh961rc3PDarBYAXeYgVgeNttTdtVuI8aHtt3EPqM3Em7Lg9Brtlrtueaw6uaaiDt/SD/9r//O9KN8Y79jQLwNsvd+t3l/OdtYY06pf6+bvd+/7dSjx4Pt+1GJaR9gwpiw0hKGe62iCEgoHIs3Pai1xNQV1smnoU5ASn1DKHJpnEMI6f3RnZ9TdD5lu0NuGldWC7kF4nvDojun+I7erBZanu8gXvGISbyHbrmNPWet+6cOUalS6pdMbmXWB7Mh4v7mdvaxCbkHMk0f66bh5Lu3HEPVrffPpXErH9uwmAhyo3wTpxyYhAPwVKxD6tOxFua7qenXhT/VnYXOFAZhpomkyBeK9oyCetA1VIgDxnOrbcbw0LWbyPBJ0wUbGnVThxbCUb2F+WBG4T4Q9kuOqiuWQVUSbU9MMs5xJz9x94AhspRN9zVKtFK+dkt0FxrU0FIYHpQc3cT0duZJ2PE5ZOpSeI4cC4QQM2K4Fz3NcW+1Fxc8lSAdJuTMn4Cw+7oizppQoiCLV9rt9nB3qurOKBQIVysIhoFhudBmCoUK1IQiggQhxz7hlYXd3ZnhVFCGjZ3JbHZ2f3Ll2e0ONA96tPX1fWwx5Kyl0iFBbDKVzjDOlFK+u97xqQ5dArmzvb2d7yvMKN397rv1vefEQsrtPzvnsyGfKedOIsxBmuTxRIrqf2lA2T9OKJbmyoWCawMhpt6qC4QQuUO70Dbgl1u4pusKeKnbgirpzTxw5+fLdrVQHWLdybxoiESTXs9HDkqudGuRVnegEKYarwm1Q8KSRZNII+HGZKZ/J9Sp/2Q9Cr/Jvyz54N0bpfO4qarwZjlIxB1b4m3EoI2hKdCQn7k13e2+br+BEKph24Vx61HhUVEQ4phQtG4xIRZdxAKGaBU2pMi7Zrtu7tGDR5Bshzxp1vt/mG2Irjc7GyqC8JniM+zsdwcnEOpAuLkXglv6lGrh4xAr0eMDh1ube51zEIq2vbJ4IqEoBYs3KLKYaC+OEjqKCsUisF9VQK+KQGh4q/ZihTkmugleao0IuU6sQ8KWHbyq9Hq9V0Fh6CWpp5mdTimMXgy2IqLHhB7H9f3a1s8IfRGHWn9j7fntTh1CpnR3cjN6sVZSdRSdjxDEW4fT01uEhYJYlxINBYcQee2kMSFRAOlBz3R8f8EFQo2vQh0wHJVPCUKVDgvf7+KkyYSXcuQ9sL+oJJmvtOch4yIKOZhxz2Obg+wS06NBdwXBNNi5V9sO2XFCyCmic3WinRfbLzKc+Z308vbdexlNTerRRv18gEiZCUR9+DmiSKk3VJgbIPuJVZrXhEwxEbhlTGgsuJBLCW5Vi8OKxyvXA0GI2oXC9SuUVh4WqlOe4v3gzl9Bvs/b5cIQK2a0k6kz6Cbub6WX6kq43Z0N605paSs1WzpOeDesE6QBveMcZF6sQX/XeRx1/me/Qzki0bniMF4ZqayeRAhhCAPxLtc1gtnKZ6k35WLW0YCw5drQhlautdzyDDbRq0K1MGy3fyjnIA5VvVkoBFPtmSmYOKEF5H90g4dzsPEPEIeYhbcG301GUXR/Nn03U6el/NNsfmlpZXaQXnEIciYnRoQQl+m15w5EPTItNVnfeekoLHx5YDzbu40sq7650WHkXF25znfLOeB524S5IFFwb3IHyhtZ676ZhLOfO9AoWNdytlt8BL1azp7hCFVW3UI14X5/vei2oRWCcpFwq1V3NXZ0dUEsdT0SiQbiEFLpoCuOlk031koGZ/1lmF6gb9paC4mu1yfT6QyGBEdWoH/bCwmmJPp2bW3/z1EYOaWNPnby+Xr4vN7fm1y5c6cf/uicSUkrq+W4537LScF57SF2YMSF2zlxhBBGUubtLpbLZfvBlPv9VciavNly3cB+OFW1IfGAX0zZkD9brx7YLU9VvfZqAFvnrtv2jOfU+yuQStONu7cACXPNifJ7W1tb2zuhA3NWfWlvL4PhtuLS/vbWi5BxTMJo7du1qHTwEzF/CrkWrXV+/N/SwVo+n/82en6ncxYhI8l2uXxCqgEzlhewaE8hJN6MwCMbMmjE2jMzbXC9uR5SMYc/hzfnvKEghDLuVZriW2/u2hykSYor165ebcNw1a5gVVGcsA9e+hyij8TNX0n82a87lhirn/T74I4Me7TU34QBi0PkOqUObKs5VO04nJZKnmpahng67cDoTc8yocWSMAuckGnE5NAEE3Mts5d6s0AcEyKmQsjEK7bQvRLwJBgCdarjm5B4YNhFXLyzglX4Bn7BEKhoYoYXkzARLyVpTEhMvgo0ZZSKJQ1VxQYUGsNxmOjxNJioxaKpGPEQha8MjC1KfQvqo85REs4Wt6saPXN6ZL6mVFaDEwmnPAoX5CxtTbxNCDcGxmcNxnVxFfCBpSf15IgQbGjEOQB+iO9gjhcvdcQLNWJ15vAFM10Xb1/FEPHil7hXGhY48L+MkdHSfrzSE7+HBiMNghSjEwZoSd2giDFH6Mw41AxFubFYfpsQEqzd5tjUaGf2yPOLQ0I4LRWLSKplxYS6eEqnKMNqOSY8HHg0zRCtLbOILpbrxbssYiEDfFAsaiCxVCjsJI6mCBhTE2sLGAlYR2SAeJ0/9hVxb4iIKbgNFO4n8jmN37/DZ9oQKjAzaTN4CzFnF92H3DIcS42yMAKnjmeaeKkJ6cnRlcUPUbBoSAUhXP1oaMXCYYEBjITEH7ClBj02YMIsAR2vwQ6zvTAzI3A8bpiIG0SwAcnhWjCJGcTjBnEgQe1oyaSvxeD4HMv+SCQbuiBW9V8vZBTFkxr3+hW424QdvEyJB1Hx4mmqNvF5HU7jGxBe4G5wv4UxoLMS2ATP2Isx4Sj6hTXhOyte8ozfdxRhJ/aLoYT5yOHnwlnhN7cg91gONARYgTQbf6hBCMauZiBxFk6R4oCL+odz4zlXAGCgXVi1c7lR1RCEbvlhBTNLJaWX6W4X4Lq1VDqdqqX363B/2SnP83tffunxD1wtPue609/+yEbvtQKYF8Sz7kQQzH+x4CHV8HiYn051u/GTbijL2cZKGK95n3x4VRGvw/1S30ghxGsOoQmBGLRXWwsVsbbL6/38RC37dCBcNJ2tdWejkuXxw9j/mcRrDL/g96Z8X0O411zYHUJp9jAxgaK+tNxN383/ZXlaPIfqDmahGGOoU1DUTjkK+kSPpT6S4sQr6pMGpqDQauzsrX+1drvzZHY6BUlmsBNCAwEu6jinrn/9kvmE54nJzfd9scis9n5c2tl59k3JQbhza3piMNieLFGwHxLL1NYvNdbOI2yIZ0sEWkFo/ExiQe3KfF4DD40caJ6YKEPQI5xmKvyLzTOjt9a1+Em66DY05jAKlUd0j1pmOTXY7xOKoYJZoujidxD+v170xxD0SCSzt71/3kWRyyfx2sfBT1EJev+LvpRPJNElOweEnjmFXVrBQAPhp/HxJRTjSdwhj63iaZSRcUYUT9ovYQ34m0S0cSeUkpKSkpKSkpKSkpKSkpKSkpKSkhpbqeMu5R/HXco/jbuU34y7lH8edyn/Mu5S/nXcpfzDuEv59bhLEl5+/R0QXnQi+OT6O6gWF12QP7mUfxt3KZ+dqF+9/cevfvbpqVucvenxfU4857s/ON/RR7p4wtMvWxKedfSRJOHRa5GE5970+D4nnvPdH1wuwvG3oSQ8bd+zjz6SJDx6LTLTnHvTY/uMvw0l4Wn7nn30kSTh0WuRhOfe9Pg+J57z3R9cLsLxt6EkPG3fs48+kiQ8ei0y05x702P7jL8NJeFp+5599JEk4dFrkZnm3Jse22f8bSgJT9v37KOPJAmPXoskPPemx/c58Zzv/uByEY6/DSXhafueffSRJOHRa5GE5970+D4nnvPdH1wuwvG3oSQ8bd+zjz6SJDx6LTLTnHvTY/uMvw0l4Wn7nn30kf4PSF6fBgW79TgAAAAASUVORK5CYII="></img></p></p>
                    </div>
                    <div class="col-md-6">
                        <h2 class="h4">Servicios</h2>
                        <p> *Diseño, evaluación y ejecución de proyectos de fuentes de agua ornamentales, secuenciales y danzantes.<br>
                            *Provisión de materiales: Bombas de Agua, Electroválvulas y Tableros de control<br>
                            *Instalación e implementación de Sistemas de gestión comercial<br>
                        </p>
                    </div>
                </div>
            </div>
        </section>
    </div><!-- END COLORLIB-MAIN -->
</div><!-- END COLORLIB-PAGE -->

</section>



<%@include file="footer.jsp" %>
