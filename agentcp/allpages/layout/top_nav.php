<header>
    <nav class="navbar navbar-default navbar-static-top no-margin" role="navigation">
        <div class="navbar-brand-group">
            <a class="navbar-sidebar-toggle navbar-link" data-sidebar-toggle>
                <i class="fa fa-lg fa-fw fa-bars"></i>
            </a>
            <a class="navbar-brand hidden-xxs" href="../admin_template/index.html">
                <span class="sc-visible">
                    V
                </span>
                <span class="sc-hidden">
                    <span class="bold">Agents</span>
                    control panel
                </span>
            </a>
        </div>
        <ul class="nav navbar-nav navbar-nav-expanded pull-right margin-md-right">
            <li class="dropdown">
                <a data-toggle="dropdown" class="dropdown-toggle navbar-user" href="#">
                    <?php
                        if($_SESSION['agent_avatar'] == ""){
                        ?>
                            <img class="img-circle" src="../images/avatar/user-placeholder.png">
                            <span class="hidden-xs"><?php echo $_SESSION['agent_name']  ?></span>
                            <b class="caret"></b>
                        <?php     
                        }else{
                        ?>
                            <img class="img-circle" src="../<?php echo $_SESSION['agent_avatar']?>">
                            <span class="hidden-xs"><?php echo $_SESSION['agent_name']  ?></span>
                            <b class="caret"></b>
                        <?php
                        }
                    ?>
                </a>
                <ul class="dropdown-menu pull-right-xs">
                    <li><a href="../agentcp/logout.php">Log Out</a></li>
                </ul>
            </li>
        </ul>
        
    </nav>
</header>