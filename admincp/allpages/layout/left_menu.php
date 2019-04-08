<aside class="sidebar sidebar-default">
                <div class="sidebar-profile">
                    <img class="img-circle profile-image" src="../admin_template/demo/images/profile.jpg">

                    <div class="profile-body">
                        <h4>Marlon Brice</h4>

                        <div class="sidebar-user-links">
                            <a class="btn btn-link btn-xs" href="../admin_template/pages-profile.html" data-placement="bottom" data-toggle="tooltip" data-original-title="Profile"><i class="fa fa-user"></i></a>
                            <a class="btn btn-link btn-xs" href="../admin_template/javascript:;"       data-placement="bottom" data-toggle="tooltip" data-original-title="Messages"><i class="fa fa-envelope"></i></a>
                            <a class="btn btn-link btn-xs" href="../admin_template/javascript:;"       data-placement="bottom" data-toggle="tooltip" data-original-title="Settings"><i class="fa fa-cog"></i></a>
                            <a class="btn btn-link btn-xs" href="../admin_template/pages-sign-in.html" data-placement="bottom" data-toggle="tooltip" data-original-title="Logout"><i class="fa fa-sign-out"></i></a>
                        </div>
                    </div>
                </div>
                <nav>
                    <h5 class="sidebar-header">Navigation</h5>
                    <ul class="nav nav-pills nav-stacked">
                        <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='dashboards') echo 'active';} ?>">
                            <a href="?page=dashboards" title="Disabled">
                                <i class="fa fa-lg fa-fw fa-th"></i> Dashboards
                            </a>
                        </li>

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_agent' || $_REQUEST['page']=='import_export_agent') echo 'active open';} ?>">
                            <a href="#" title="Users">
                                <i class="fa fa-lg fa-fw fa-user"></i> Đại lý bán lẻ
                            </a>
                            <ul class="nav-sub">
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_agent') echo 'active open';} ?>'>
                                    <a href="?page=crud_agent" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i> Quản lý đại lý
                                    </a>
                                </li>
                                <li class='<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='import_export_agent') echo 'active open';} ?>'>
                                    <a href="?page=import_export_agent" title="Profile">
                                        <i class="fa fa-fw fa-caret-right"></i> Import/Export Đại lý bán lẻ
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-dropdown">
                            <a href="#" title="Users">
                                <i class="fa fa-lg fa-fw fa-user"></i> Khách hàng
                            </a>
                            <ul class="nav-sub">
                                <li>
                                    <a href="?page=crud_agent" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i> Quản lý khách hàng
                                    </a>
                                </li>
                                <li>
                                    <a href="?page=" title="Profile">
                                        <i class="fa fa-fw fa-caret-right"></i> Import/Export khách hàng
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-dropdown">
                            <a href="#" title="Users">
                                <i class="fa fa-lg fa-fw fa-user"></i> Admin
                            </a>
                            <ul class="nav-sub">
                                <li>
                                    <a href="?page=crud_agent" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i> Quản lý Admin
                                    </a>
                                </li>
                                <li>
                                    <a href="?page=" title="Profile">
                                        <i class="fa fa-fw fa-caret-right"></i> Import/Export Admin
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-dropdown">
                            <a href="#" title="Users">
                                <i class="fas fa-boxes"></i> Sản phẩm
                            </a>
                            <ul class="nav-sub">
                                <li>
                                    <a href="?page=crud_product" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i> Quản lý Sản phẩm
                                    </a>
                                </li>
                                <li>
                                    <a href="?page=" title="Profile">
                                        <i class="fa fa-fw fa-caret-right"></i> Danh mục
                                    </a>
                                </li>
                                <li>
                                    <a href="?page=" title="Profile">
                                        <i class="fa fa-fw fa-caret-right"></i> Nhà sản xuất
                                    </a>
                                </li>

                            </ul>
                        </li>

                        <li class="nav-dropdown">
                            <a href="../admin_template/#" title="Users">
                                <i class="fas fa-chart-bar"></i> Thống kê
                                <!-- <span class="label label-danger pull-right">New</span> -->
                            </a>
                            <ul class="nav-sub">
                                <li>
                                    <a href="../admin_template/email-inbox.html" title="Inbox">
                                        <i class="fa fa-fw fa-caret-right"></i> Thống kê 
                                    </a>
                                </li>
                                <li>
                                    <a href="../admin_template/email-message.html" title="Message">
                                        <i class="fa fa-fw fa-caret-right"></i> Thống kê khách hàng
                                    </a>
                                </li>
                                <li>
                                    <a href="../admin_template/email-compose.html" title="Compose">
                                        <i class="fa fa-fw fa-caret-right"></i> Thống kê đại lý
                                    </a>
                                </li>
                            </ul>
                        </li>

                </nav>
            </aside>