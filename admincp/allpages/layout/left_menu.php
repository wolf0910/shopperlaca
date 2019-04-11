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

                        <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_order') echo 'active';} ?>">
                            <a href="?page=crud_order" title="Disabled">
                                <i class="fa fa-lg fa-fw fa-th"></i> Đơn đặt hàng
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

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_customer' || $_REQUEST['page']=='import_export_customer' ) echo 'active open';} ?>">
                            <a href="#" title="Users">
                                <i class="fa fa-lg fa-fw fa-user"></i> Khách hàng
                            </a>
                            <ul class="nav-sub">
                                <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_customer') echo 'active';} ?>">
                                    <a href="?page=crud_customer" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i> Quản lý khách hàng
                                    </a>
                                </li>
                                <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='import_export_customer') echo 'active open';} ?>">
                                    <a href="?page=import_export_customer" title="Profile">
                                        <i class="fa fa-fw fa-caret-right"></i> Import/Export khách hàng
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_admin' || $_REQUEST['page']=='import_export_admin' ) echo 'active open';} ?> ">
                            <a href="#" title="Users">
                                <i class="fa fa-lg fa-fw fa-user"></i> Admin
                            </a>
                            <ul class="nav-sub">
                                <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_admin') echo 'active';} ?>">
                                    <a href="?page=crud_admin" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i> Quản lý Admin
                                    </a>
                                </li>
                                <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='import_export_admin') echo 'active';} ?>">
                                    <a href="?page=import_export_admin" title="Profile">
                                        <i class="fa fa-fw fa-caret-right"></i> Import/Export Admin
                                    </a>
                                </li>
                            </ul>
                        </li>

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_category' || $_REQUEST['page']=='crud_product' || $_REQUEST['page']=='crud_producer') echo 'active open';} ?> ">
                            <a href="#" title="Users">
                                <i class="fas fa-boxes"></i> Sản phẩm
                            </a>
                            <ul class="nav-sub">
                                <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_product') echo 'active';} ?>">
                                    <a href="?page=crud_product" title="Members">
                                        <i class="fa fa-fw fa-caret-right"></i> Quản lý Sản phẩm
                                    </a>
                                </li>
                                <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_category') echo 'active';} ?>">
                                    <a href="?page=crud_category" title="Profile">
                                        <i class="fa fa-fw fa-caret-right"></i> Danh mục
                                    </a>
                                </li>
                                <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='crud_producer') echo 'active';} ?>">
                                    <a href="?page=crud_producer" title="Profile">
                                        <i class="fa fa-fw fa-caret-right"></i> Nhà sản xuất
                                    </a>
                                </li>

                            </ul>
                        </li>

                        <li class="nav-dropdown <?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='customer_statistic' || $_REQUEST['page']=='agent_statistic' ) echo 'active open';} ?>">
                            <a href="#" title="Users">
                                <i class="fas fa-chart-bar"></i> Thống kê
                                <!-- <span class="label label-danger pull-right">New</span> -->
                            </a>
                            <ul class="nav-sub">
                                <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='customer_statistic') echo 'active';} ?>">
                                    <a href="?page=customer_statistic" title="Message">
                                        <i class="fa fa-fw fa-caret-right"></i> Thống kê khách hàng
                                    </a>
                                </li>
                                <li class="<?php if(isset($_REQUEST['page'])){if($_REQUEST['page']=='agent_statistic') echo 'active';} ?>">
                                    <a href="?page=agent_statistic" title="Compose">
                                        <i class="fa fa-fw fa-caret-right"></i> Thống kê đại lý
                                    </a>
                                </li>
                            </ul>
                        </li>

                </nav>
            </aside>