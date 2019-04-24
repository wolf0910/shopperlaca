<header>
    <nav class="navbar navbar-default navbar-static-top no-margin" role="navigation">
        <div class="navbar-brand-group">
            <a class="navbar-sidebar-toggle navbar-link" data-sidebar-toggle>
                <i class="fa fa-lg fa-fw fa-bars"></i>
            </a>
            <a class="navbar-brand hidden-xxs" href="?page=dashboard">
                <span class="sc-visible">
                    A
                </span>
                <span class="sc-hidden">
                    <span class="bold">Trang quản trị</span>
                </span>
            </a>
        </div>
        <ul class="nav navbar-nav navbar-nav-expanded pull-right margin-md-right">
            <!-- <li class="hidden-xs">
                <form class="navbar-form">
                    <div class="navbar-search">
                        <input type="text" placeholder="Search &hellip;" class="form-control">
                        <button class="btn" type="submit"><i class="fa fa-search"></i></button>
                    </div>
                </form>
            </li> -->
            <!-- <li class="dropdown">
                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                    <i class="glyphicon glyphicon-envelope"></i>
                    <span class="badge badge-up badge-dark badge-small">3</span>
                </a>
                <ul class="dropdown-menu dropdown-messages pull-right">
                    <li class="dropdown-title bg-inverse">New Messages</li>
                    <li class="unread">
                        <a href="#" class="message">
                            <img class="message-image img-circle" src="../admin_template/demo/images/avatars/1.jpg">

                            <div class="message-body">
                                <strong>Ernest Kerry</strong><br>
                                Hello, You there?<br>
                                <small class="text-muted">8 minutes ago</small>
                            </div>
                        </a>
                    </li>
                    <li class="unread">
                        <a href="#" class="message">
                            <img class="message-image img-circle" src="../admin_template/demo/images/avatars/3.jpg">

                            <div class="message-body">
                                <strong>Don Mark</strong><br>
                                I really appreciate your &hellip;<br>
                                <small class="text-muted">21 hours</small>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="message">
                            <img class="message-image img-circle" src="../admin_template/demo/images/avatars/8.jpg">

                            <div class="message-body">
                                <strong>Jess Ronny</strong><br>
                                Let me know when you free<br>
                                <small class="text-muted">5 days ago</small>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="message">
                            <img class="message-image img-circle" src="../admin_template/demo/images/avatars/7.jpg">

                            <div class="message-body">
                                <strong>Wilton Zeph</strong><br>
                                If there is anything else &hellip;<br>
                                <small class="text-muted">06/10/2014 5:31 pm</small>
                            </div>
                        </a>
                    </li>
                    <li class="dropdown-footer">
                        <a href="#"><i class="fa fa-share"></i> See all messages</a>
                    </li>
                </ul>
            </li> -->
            <!-- <li class="dropdown">
                <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                    <i class="glyphicon glyphicon-globe"></i>
                    <span class="badge badge-up badge-danger badge-small">3</span>
                </a>
                <ul class="dropdown-menu dropdown-notifications pull-right">
                    <li class="dropdown-title bg-inverse">Notifications (3)</li>
                    <li>
                        <a href="#" class="notification">
                            <div class="notification-thumb pull-left">
                                <i class="fa fa-clock-o fa-2x text-info"></i>
                            </div>
                            <div class="notification-body">
                                <strong>Call with John</strong><br>
                                <small class="text-muted">8 minutes ago</small>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="notification">
                            <div class="notification-thumb pull-left">
                                <i class="fa fa-life-ring fa-2x text-warning"></i>
                            </div>
                            <div class="notification-body">
                                <strong>New support ticket</strong><br>
                                <small class="text-muted">21 hours ago</small>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="notification">
                            <div class="notification-thumb pull-left">
                                <i class="fa fa-exclamation fa-2x text-danger"></i>
                            </div>
                            <div class="notification-body">
                                <strong>Running low on space</strong><br>
                                <small class="text-muted">3 days ago</small>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="notification">
                            <div class="notification-thumb pull-left">
                                <i class="fa fa-user fa-2x text-muted"></i>
                            </div>
                            <div class="notification-body">
                                New customer registered<br>
                                <small class="text-muted">06/18/2014 12:31 am</small>
                            </div>
                        </a>
                    </li>
                    <li class="dropdown-footer">
                        <a href="#"><i class="fa fa-share"></i> See all notifications</a>
                    </li>
                </ul>
            </li> -->
            <li class="dropdown">
                <a data-toggle="dropdown" class="dropdown-toggle navbar-user" href="#">
                    <img class="img-circle" src="../<?php echo $_SESSION['administrator_avatar']; ?>">
                    <span class="hidden-xs"><?php echo $_SESSION['administrator_name']; ?></span>
                    <b class="caret"></b>
                </a>
                <ul class="dropdown-menu pull-right-xs">
                   <!--  <li class="arrow"></li>
                    <li><a href="../admin_template/pages-profile.html">Profile</a></li>
                    <li><a href="#"><span class="badge badge-danger pull-right">2</span> Inbox</a></li>
                    <li><a href="#">Messages</a></li>
                    <li><a href="#">Settings</a></li> -->
                    <li class="divider"></li>
                    <li><a href="logout.php"> <i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
                </ul>
            </li>
        </ul>
        
    </nav>
</header>