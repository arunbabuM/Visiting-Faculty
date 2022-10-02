<header>
    <nav class="top-navbar d-flex justify-content-xl-end justify-content-between align-items-center">
        <a href="${pageContext.request.contextPath}/dashboard"><img src="${pageContext.request.contextPath}/image/logo-nmims.png" alt="NMIMS LOGO"
                class="nmims-logo-smalldevices me-auto"></a>
        <div class="navbar-logo d-none me-auto">
            <a href="${pageContext.request.contextPath}/dashboard"> <img src="${pageContext.request.contextPath}/image/logo-nmims.png" class="nmims-logo"> </a>
        </div>
        <button class="me-auto left-sidebar-toggle"
            style="border: none; outline: none; background-color: white;"><i
                class="fa-solid fa-angles-left"></i></button>
        <ul class="top-navbar__list">
            <li style="color: #fc6964; font-weight: bold;"><img src="${pageContext.request.contextPath}/icons/admin.png" class="ps-3 pe-2">${role == 'User' ? role : role.split("_")[1]}
            </li>

            <li><a href="" class="text-dark"><img src="${pageContext.request.contextPath}/icons/notification.png" alt=""> Notification</a></li>

            <div class="btn-group">
                <button class="btn btn-white dropdown-toggle" type="button" id="defaultDropdown"
                    data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
                    <img src="${pageContext.request.contextPath}/icons/user.png" alt=""> Hi! ${role == 'User' ? role : role.split("_")[1]}
                </button>
                <ul class="dropdown-menu userprofile-dropdown-menu" aria-labelledby="defaultDropdown">
                    <li><a class="dropdown-item" href="#"><i class="fas fa-user-cog"></i> Settings</a></li>
                    <li><a class="dropdown-item" href="#"><i class="fas fa-user-circle"></i> Manage account</a>
                    </li>
                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i class="fas fa-sign-out-alt"></i></i>
                            Signout</a></li>
                </ul>
            </div>
        </ul>
        <div class="hamburger-smalldevices"><img src="${pageContext.request.contextPath}/icons/HamburgerIcon.png" alt="" width="24px"
                height="20px">
        </div>
    </nav>
</header>