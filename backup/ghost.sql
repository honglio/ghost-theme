-- MySQL dump 10.13  Distrib 5.5.35, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ghost
-- ------------------------------------------------------
-- Server version	5.5.35-0ubuntu0.12.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `object_type` varchar(150) NOT NULL,
  `action_type` varchar(150) NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'8c88f447-84dc-40bb-b56d-19cee0f74868','Edit posts','post','edit',NULL,'2014-03-23 01:47:16',1,'2014-03-23 01:47:16',1),(2,'914bb6f6-5b78-45fe-a27e-1845e4fdb9e9','Remove posts','post','remove',NULL,'2014-03-23 01:47:16',1,'2014-03-23 01:47:16',1),(3,'4cd2b09a-551e-4f79-8b3e-f08633a1ee38','Create posts','post','create',NULL,'2014-03-23 01:47:16',1,'2014-03-23 01:47:16',1);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_roles`
--

DROP TABLE IF EXISTS `permissions_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions_roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_roles`
--

LOCK TABLES `permissions_roles` WRITE;
/*!40000 ALTER TABLE `permissions_roles` DISABLE KEYS */;
INSERT INTO `permissions_roles` VALUES (1,1,1),(2,1,2),(3,1,3);
/*!40000 ALTER TABLE `permissions_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions_users`
--

DROP TABLE IF EXISTS `permissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions_users`
--

LOCK TABLES `permissions_users` WRITE;
/*!40000 ALTER TABLE `permissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `title` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `markdown` mediumtext,
  `html` mediumtext,
  `image` text,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `page` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(150) NOT NULL DEFAULT 'draft',
  `language` varchar(6) NOT NULL DEFAULT 'en_US',
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_description` varchar(200) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `published_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'1921fc2d-4b51-49ed-ade3-f415f0c5ba34','肥皂泡','welcome-to-ghost','![](/content/images/2014/May/paopao.jpg)','<p><img src=\"/content/images/2014/May/paopao.jpg\" alt=\"\" /></p>',NULL,0,0,'published','en_US',NULL,NULL,1,'2014-03-23 01:47:16',1,'2014-05-01 11:05:44',1,'2014-03-23 01:47:16',1),(7,'0796b3a3-ee47-4ab8-880a-f25b13bbd482','长椅','chang-yi','![alt](/content/images/2014/May/i__f__.jpg)','<p><img src=\"/content/images/2014/May/i__f__.jpg\" alt=\"alt\" /></p>',NULL,0,0,'published','en_US',NULL,NULL,1,'2014-05-01 14:57:34',1,'2014-05-01 14:57:44',1,'2014-05-01 14:57:44',1),(13,'9a80f245-1ea0-45b6-9306-be5dc4252b13','树叶','shu-xie','![alt](/content/images/2014/May/IMG_8568.jpg)','<p><img src=\"/content/images/2014/May/IMG_8568.jpg\" alt=\"alt\" /></p>',NULL,0,0,'published','en_US',NULL,NULL,1,'2014-05-01 15:22:05',1,'2014-05-04 17:44:06',1,'2014-05-01 15:22:32',1),(14,'96bedd6d-0ea5-476a-8cb3-00a8ddc3aa85','麦穗','mai-sui','![alt](/content/images/2014/May/IMG_9857.jpg)','<p><img src=\"/content/images/2014/May/IMG_9857.jpg\" alt=\"alt\" /></p>',NULL,0,0,'published','en_US',NULL,NULL,1,'2014-05-01 15:23:09',1,'2014-05-04 17:43:50',1,'2014-05-01 15:23:26',1),(17,'fd696af2-2025-4724-b3b2-3829b4125fcc','蓝天','lan-tian','![alt](/content/images/2014/May/tree_sky.jpg)','<p><img src=\"/content/images/2014/May/tree_sky.jpg\" alt=\"alt\" /></p>',NULL,0,0,'published','en_US',NULL,NULL,1,'2014-05-04 10:52:12',1,'2014-05-04 10:52:44',1,'2014-05-04 10:52:29',1),(19,'8fe565d9-17b8-4374-889b-c28c7897af5d','4步教你如何编写引人入胜的课件内容','bi-ji-ben','![alt](/content/images/2014/May/IMG_4749.jpg)\n\n    起草一个引人注目的课件内容可能会成为一项艰巨的任务。大多数作者似乎对什么才是成功的课件设计没有全面的把握，而内容总是最大的挑战。如果你意识到这个问题，那么本文提供了一个可以给你启发的正确方向。\n    \n# 1.收集资料\n**目的：**收集一页到两页的关于内容，受众和目标的相关信息。\n\n在你开始之前，留心收集关于你所写的主题的信息。受众是谁？这个课件的目的是什么？你想让观众知道的是什么？多少观众事先知道？内容是否富有创造性？在你开始撰写课件之前,先收集一页到两页的相关信息。这将帮助你提高效率。\n\n# 2.找出关键词\n**目的：**在写草稿之前,挑选3个关键词.\n\n关键词是否有足够的创新性.选择阻力最少的方式编写课件结构.即什么样的结构最易于被受众接受.\n\n# 3.每页课件写初稿\n**目的：**应该基本描述出一个完整的故事.\n\n开始努力工作了!为每张课件配上适当的背景图片.在每页上添加标题.友好的最后一页,外加一些额外的信息.根据第2步构建的结构来添加信息.用尽可能少的语句在每页阐明内容和要点.初稿是为了让你在开始设计时就可看到课件的全貌,这将使第4步变的容易.\n\n# 4.正式编辑\n**目的：**保证你不错过任何拼写错误.\n\n补全每页课件.确保至少经过三次修改和编辑.可让别人帮助查阅有无拼写错误.下面是花龙点睛之处:用简单明了的语句,传递主题一致的信息.','<p><img src=\"/content/images/2014/May/IMG_4749.jpg\" alt=\"alt\" /></p>\n\n<pre><code>起草一个引人注目的课件内容可能会成为一项艰巨的任务。大多数作者似乎对什么才是成功的课件设计没有全面的把握，而内容总是最大的挑战。如果你意识到这个问题，那么本文提供了一个可以给你启发的正确方向。\n</code></pre>\n\n<h1 id=\"1\">1.收集资料</h1>\n\n<p><strong>目的：</strong>收集一页到两页的关于内容，受众和目标的相关信息。</p>\n\n<p>在你开始之前，留心收集关于你所写的主题的信息。受众是谁？这个课件的目的是什么？你想让观众知道的是什么？多少观众事先知道？内容是否富有创造性？在你开始撰写课件之前,先收集一页到两页的相关信息。这将帮助你提高效率。</p>\n\n<h1 id=\"2\">2.找出关键词</h1>\n\n<p><strong>目的：</strong>在写草稿之前,挑选3个关键词.</p>\n\n<p>关键词是否有足够的创新性.选择阻力最少的方式编写课件结构.即什么样的结构最易于被受众接受.</p>\n\n<h1 id=\"3\">3.每页课件写初稿</h1>\n\n<p><strong>目的：</strong>应该基本描述出一个完整的故事.</p>\n\n<p>开始努力工作了!为每张课件配上适当的背景图片.在每页上添加标题.友好的最后一页,外加一些额外的信息.根据第2步构建的结构来添加信息.用尽可能少的语句在每页阐明内容和要点.初稿是为了让你在开始设计时就可看到课件的全貌,这将使第4步变的容易.</p>\n\n<h1 id=\"4\">4.正式编辑</h1>\n\n<p><strong>目的：</strong>保证你不错过任何拼写错误.</p>\n\n<p>补全每页课件.确保至少经过三次修改和编辑.可让别人帮助查阅有无拼写错误.下面是花龙点睛之处:用简单明了的语句,传递主题一致的信息.</p>',NULL,0,0,'published','en_US',NULL,NULL,1,'2014-05-04 11:03:32',1,'2014-08-22 22:34:11',1,'2014-05-04 11:03:32',1),(31,'ba19fa56-09a3-4d64-8118-f8104de982c0','6个课件设计的注意事项','6ge-ke-jian-she-ji-de-zhu-yi-shi-xiang','![alt](/content/images/2014/May/MyLife.jpg)\n\n    好的课件设计是很难掌握的，因为它需要许多元素相互协调，包括颜色，字体，图片，图标和背景。虽然有很多作品表现的设计难题，但是不要紧张，只要遵循“少就是多”的原则，让你的设计保持整洁就可以了。\n\n不知道从哪里开始？遵循下面这些设计注意事项，就可以确保你的课件简洁、和谐、明确。\n\n# 1. 背景图片\n**错误：**把文本写在多种颜色的或有图案的背景。这将使你的文本内容难以阅读，并因此会失去听众的注意力。\n![alt](/content/images/2014/Jun/Bad1.jpg)\n\n**正确：**有图案的背景，如果使用正确，可以极大的增强课件的表现力。使用光亮的、轻快的背景图案，可以使文字易于阅读。如果你想使用一个大幅背景，一定要放置一个坚实的造型使得你的文字从背景中分别出来。\n![alt](/content/images/2014/Jun/Good1.jpg)\n\n# 2. 文本对齐\n**错误：**中心对齐所有的文字和图像。尤其是当大段文本居中对齐，会非常混乱，难以阅读。\n![alt](/content/images/2014/Jun/Bad2.jpg)\n\n**正确：**只在一些文字上使用中心对齐。使用左对齐会有更平衡的感觉。\n![alt](/content/images/2014/Jun/Good2.jpg)\n\n# 3. 字体大小\n**错误：**所有的文字的大小相同。演示文稿的某些部分比其他部分更重要。您的演示文稿的设计应强调那些最重要的部分。如果所有的文字的大小相同，读者不会知道哪些地方需要集中他们的注意力。\n![alt](/content/images/2014/Jun/Bad3.jpg)\n\n**正确：**如果你一定要在幻灯片上插入很多文字，确保那些重要的文字较大些。这个简单的技术可以确保读者先捕捉到最有价值的信息，而不是辅助信息。\n![alt](/content/images/2014/Jun/Good3.jpg)\n\n# 4. 阴影\n**错误：**对所有的文字都使用阴影。有些人为了使他们的文本脱颖而出使用阴影。然而，当你使用薄的，黑暗的阴影以及白色的背景，文字看起来很模糊。\n![alt](/content/images/2014/Jun/Bad4.jpg)\n\n**正确：**如果你打算使用阴影文字，只在开头使用，不要在段中使用。也可以考虑使用黑色背景白色粗体文本，这将有助于您的文字“流行”。\n![alt](/content/images/2014/Jun/Good4.jpg)\n\n# 5. 照片和图片\n**错误：**低分辨率图像。简单地说，这使得你看起来并不在乎你的课件。低分辨率的图像也许在大纲视图看起来不错，但在放映模式和全屏模式时变得模糊。同时，低分辨率的图像往往是从互联网直接拷贝来的，没有购买使用权。偷窃图片是非法的，也会损害你的信誉。\n![alt](/content/images/2014/Jun/Bad5.jpg)\n\n**正确：**只使用大小范围在1000像素的图片。如果你有300~500像素的图片，保持它的原大小并放在页面边上。同样的规则也适用于图标和插图。高分辨率图片，图标，和插图可以从各种互联网上购买。推荐两个有信誉的网站。\n![alt](/content/images/2014/Jun/Good5.jpg)\n\n# 6. 字体\n**错误：**夸张的字体。如果你选择草体或过于变形的字体，你的课件会被认为很轻佻，并且你的文字会很难阅读。使用简单的字体，你仍然可以创作一个有趣的演示。\n![alt](/content/images/2014/Jun/Bad6.jpg)\n\n**正确：**当选择一个字体时，选择那些具有多种字体粗细的文字。例如，加粗，斜体，细体。这样你可以再获得多种的效果的同时，仍然保持字体是一致的。\n![alt](/content/images/2014/Jun/Good6.jpg)\n\n> 出色的课件设计应该做到三点：易于阅读、简洁、可欣赏。','<p><img src=\"/content/images/2014/May/MyLife.jpg\" alt=\"alt\" /></p>\n\n<pre><code>好的课件设计是很难掌握的，因为它需要许多元素相互协调，包括颜色，字体，图片，图标和背景。虽然有很多作品表现的设计难题，但是不要紧张，只要遵循“少就是多”的原则，让你的设计保持整洁就可以了。\n</code></pre>\n\n<p>不知道从哪里开始？遵循下面这些设计注意事项，就可以确保你的课件简洁、和谐、明确。</p>\n\n<h1 id=\"1\">1. 背景图片</h1>\n\n<p><strong>错误：</strong>把文本写在多种颜色的或有图案的背景。这将使你的文本内容难以阅读，并因此会失去听众的注意力。\n<img src=\"/content/images/2014/Jun/Bad1.jpg\" alt=\"alt\" /></p>\n\n<p><strong>正确：</strong>有图案的背景，如果使用正确，可以极大的增强课件的表现力。使用光亮的、轻快的背景图案，可以使文字易于阅读。如果你想使用一个大幅背景，一定要放置一个坚实的造型使得你的文字从背景中分别出来。\n<img src=\"/content/images/2014/Jun/Good1.jpg\" alt=\"alt\" /></p>\n\n<h1 id=\"2\">2. 文本对齐</h1>\n\n<p><strong>错误：</strong>中心对齐所有的文字和图像。尤其是当大段文本居中对齐，会非常混乱，难以阅读。\n<img src=\"/content/images/2014/Jun/Bad2.jpg\" alt=\"alt\" /></p>\n\n<p><strong>正确：</strong>只在一些文字上使用中心对齐。使用左对齐会有更平衡的感觉。\n<img src=\"/content/images/2014/Jun/Good2.jpg\" alt=\"alt\" /></p>\n\n<h1 id=\"3\">3. 字体大小</h1>\n\n<p><strong>错误：</strong>所有的文字的大小相同。演示文稿的某些部分比其他部分更重要。您的演示文稿的设计应强调那些最重要的部分。如果所有的文字的大小相同，读者不会知道哪些地方需要集中他们的注意力。\n<img src=\"/content/images/2014/Jun/Bad3.jpg\" alt=\"alt\" /></p>\n\n<p><strong>正确：</strong>如果你一定要在幻灯片上插入很多文字，确保那些重要的文字较大些。这个简单的技术可以确保读者先捕捉到最有价值的信息，而不是辅助信息。\n<img src=\"/content/images/2014/Jun/Good3.jpg\" alt=\"alt\" /></p>\n\n<h1 id=\"4\">4. 阴影</h1>\n\n<p><strong>错误：</strong>对所有的文字都使用阴影。有些人为了使他们的文本脱颖而出使用阴影。然而，当你使用薄的，黑暗的阴影以及白色的背景，文字看起来很模糊。\n<img src=\"/content/images/2014/Jun/Bad4.jpg\" alt=\"alt\" /></p>\n\n<p><strong>正确：</strong>如果你打算使用阴影文字，只在开头使用，不要在段中使用。也可以考虑使用黑色背景白色粗体文本，这将有助于您的文字“流行”。\n<img src=\"/content/images/2014/Jun/Good4.jpg\" alt=\"alt\" /></p>\n\n<h1 id=\"5\">5. 照片和图片</h1>\n\n<p><strong>错误：</strong>低分辨率图像。简单地说，这使得你看起来并不在乎你的课件。低分辨率的图像也许在大纲视图看起来不错，但在放映模式和全屏模式时变得模糊。同时，低分辨率的图像往往是从互联网直接拷贝来的，没有购买使用权。偷窃图片是非法的，也会损害你的信誉。\n<img src=\"/content/images/2014/Jun/Bad5.jpg\" alt=\"alt\" /></p>\n\n<p><strong>正确：</strong>只使用大小范围在1000像素的图片。如果你有300~500像素的图片，保持它的原大小并放在页面边上。同样的规则也适用于图标和插图。高分辨率图片，图标，和插图可以从各种互联网上购买。推荐两个有信誉的网站。\n<img src=\"/content/images/2014/Jun/Good5.jpg\" alt=\"alt\" /></p>\n\n<h1 id=\"6\">6. 字体</h1>\n\n<p><strong>错误：</strong>夸张的字体。如果你选择草体或过于变形的字体，你的课件会被认为很轻佻，并且你的文字会很难阅读。使用简单的字体，你仍然可以创作一个有趣的演示。\n<img src=\"/content/images/2014/Jun/Bad6.jpg\" alt=\"alt\" /></p>\n\n<p><strong>正确：</strong>当选择一个字体时，选择那些具有多种字体粗细的文字。例如，加粗，斜体，细体。这样你可以再获得多种的效果的同时，仍然保持字体是一致的。\n<img src=\"/content/images/2014/Jun/Good6.jpg\" alt=\"alt\" /></p>\n\n<blockquote>\n  <p>出色的课件设计应该做到三点：易于阅读、简洁、可欣赏。</p>\n</blockquote>',NULL,0,0,'published','en_US',NULL,NULL,1,'2014-06-18 20:35:02',1,'2014-08-22 22:35:11',1,'2014-06-18 21:18:02',1);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_tags`
--

DROP TABLE IF EXISTS `posts_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts_tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(11) unsigned NOT NULL,
  `tag_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_tags_post_id_foreign` (`post_id`),
  KEY `posts_tags_tag_id_foreign` (`tag_id`),
  CONSTRAINT `posts_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `posts_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_tags`
--

LOCK TABLES `posts_tags` WRITE;
/*!40000 ALTER TABLE `posts_tags` DISABLE KEYS */;
INSERT INTO `posts_tags` VALUES (18,1,14),(20,7,14),(41,17,15),(65,14,18),(66,13,18),(74,31,19),(75,19,20),(76,19,21),(77,31,21);
/*!40000 ALTER TABLE `posts_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'3541fc1e-96bf-422a-9e4a-dd848e2bcdb1','Administrator','Administrators','2014-03-23 01:47:16',1,'2014-03-23 01:47:16',1),(2,'4f201c6a-6fd8-4b33-bd31-8898216c528f','Editor','Editors','2014-03-23 01:47:16',1,'2014-03-23 01:47:16',1),(3,'dbbbb3f5-abe1-4170-8e51-6d509c7912f7','Author','Authors','2014-03-23 01:47:16',1,'2014-03-23 01:47:16',1);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (1,1,1);
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `expires` bigint(20) NOT NULL,
  `sess` varchar(4096) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0fHPuNEa45M1mQ0qUf6GlVsu',1416095140390,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-11-15T23:45:40.390Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"user\":1,\"_csrfSecret\":\"RCB2KZC7NMEvUHDjFsdg9wfy\"}'),('1HVyHnY6a7XpQhIGwt7Fftos',1416128240052,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-11-16T08:57:20.052Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"xMi5TAhHkzhNj7knJtnFsO6y\"}'),('4XeTplvUY7zKU820XpeGSrON',1418811937934,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-12-17T10:25:37.934Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"CSdLmIBz5w7pdkzT0MBBCBT6\"}'),('5dBLwAfY7IJDL2Jy4h2ZkAo0',1421814249765,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2015-01-21T04:24:09.765Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"M5w0c64XMZfiOS7lu3PGziSZ\"}'),('6mqUBGpRFc5WViHY9ylDHksW',1415913230617,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-11-13T21:13:50.617Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"jQgN02lSOpuAKozsTSZ1Gn1Z\"}'),('9I3zkLWEGkPO7x9rtD9gIS18',1419968415788,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-12-30T19:40:15.788Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"6SG8QuY0VrQgWbZQh0OyUPOF\"}'),('9yvH2CqTRMrpJytmvUeutaSx',1418454787983,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-12-13T07:13:07.983Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"RG3Eq2VUX7sXh3Js1HpTFkCX\"}'),('b1DYVI85RGXGy255dpgBRCFs',1414981856835,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-11-03T02:30:56.835Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"sNkinO0Q3KPwB27OBRCqz0AS\"}'),('D4hxcZx28G8wg6lmsI9zWQVo',1419406279134,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-12-24T07:31:19.134Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"obE1EBxDnbDPINSCnnFf5A00\"}'),('eMHaPhPcBHA9htwLxUh0nr2T',1411799329461,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-09-27T06:28:49.461Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"xajlQK7p6HZSZmseSc4xAJvd\"}'),('G8HVOkvrDsATfB1CcDXL2ZZg',1416094817350,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-11-15T23:40:17.350Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"CVQYk1ZqxrR9JjPMBxNePxy5\"}'),('IWT3vPHHqGy2V7HEBFIrLDAm',1411463572358,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-09-23T09:12:52.358Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"fGr6B0223QrkHWtAudwF7EsM\"}'),('k90bpJR7rLzj54mo1B8id5pe',1418704233500,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-12-16T04:30:33.500Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"fFeJVRfJpZ4ArkTy8JmFaB9e\"}'),('ksVbcnU6JbOLPEKmwlGTpnXt',1412008686126,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-09-29T16:38:06.126Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"JYX6n5DsQd0sr17SEqHsOUgs\"}'),('kwqHaqvcXCeZ2AjlQEmbXSOW',1420759651587,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2015-01-08T23:27:31.587Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"Ggf3eXIiLOWIwBXMtcnQE1MS\"}'),('KXJj8SHzMyFClfynDdExtSEC',1415760612993,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-11-12T02:50:12.993Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"glEEjyZ0i4YXYj8eo1Tr1Ivb\"}'),('lykNJacOPNLLH25TPpChLpNc',1420499502792,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2015-01-05T23:11:42.792Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"E3zrIE7L4BLG1Quj5aQpfFlj\"}'),('OAnvD2ONKcxhsC9xzMgXYEHV',1416030154784,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-11-15T05:42:34.784Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"0CQWVtVl2i2VskCmYYs093MP\"}'),('OuxgJ8ewdOz1UPnwckwu1BAq',1421318618644,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2015-01-15T10:43:38.644Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"W2aJzqU9DkOWTws8OOkQFPEB\"}'),('OzvNTGJdrp4w2kftV9oRJmOy',1420369933829,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2015-01-04T11:12:13.829Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"2pmxOGa4xzykrhRDEGrEZMTM\"}'),('P8UiOn96EY8RKPAOr7n4NHtw',1418689865235,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-12-16T00:31:05.235Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"CBmCVUmlV61f2491FqUbLYRK\"}'),('pdb2dGF0U8EFG4HObEcjjWwL',1421101277414,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2015-01-12T22:21:17.414Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"xyClLwFFgWmzNk9yXSnpVMiF\"}'),('qi2hH1YSQHKQlDpOTl8I4hhM',1415205245337,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-11-05T16:34:05.337Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"yKJWA4koo9w29BVpZUqo61j5\"}'),('RseGdqDDBJfqQz5dmJ5dMd8C',1419050901607,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-12-20T04:48:21.607Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"CQ7ukl83VntvZzQaDeaouw0Q\"}'),('sX7wdtyxL7G6f5sJ41t7Jum4',1420181442287,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2015-01-02T06:50:42.287Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"nKLvqQMRxeOALg54UzL0KC5f\"}'),('umSqYJ22gCj1XIkmPfICvMX4',1419710773558,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-12-27T20:06:13.558Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"ZcKZZDKg33R05ayWOBSg04To\"}'),('V71arpBi0O72gLYj0FS0vGG7',1419196363981,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-12-21T21:12:43.981Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"r9TYpJDVjbT8SXoZlBk9PPzo\"}'),('xylMzcaXG9JPAAuARF8BXnPn',1418574504218,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-12-14T16:28:24.218Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"2weypsnK1jcFSdXh5t2FDAlp\"}'),('Zx2whqki6LoiaJMXiS1AnjyX',1421574262136,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2015-01-18T09:44:22.136Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"5GkgBWEs9flvF4UIGfFSgSCi\"}'),('ZXehAFWCd5lywjRXl9bnIv1D',1419507466159,'{\"cookie\":{\"originalMaxAge\":43200000,\"expires\":\"2014-12-25T11:37:46.159Z\",\"httpOnly\":true,\"path\":\"/ghost/\"},\"_csrfSecret\":\"ynyf8XmavCCBL2iY3wCjPBHc\"}');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `key` varchar(150) NOT NULL,
  `value` text,
  `type` varchar(150) NOT NULL DEFAULT 'core',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'925d5e30-5ed5-400d-b857-10b9a0bc6997','databaseVersion','002','core','2014-03-23 01:47:16',1,'2014-03-23 01:47:16',1),(2,'27423475-182e-44d9-9062-6ff94983bd3e','dbHash','c30471aa-cf6a-4bb0-8160-a555b006586b','core','2014-03-23 01:47:16',1,'2014-03-23 01:47:17',1),(3,'5d651771-6fd8-4817-90fe-10d6fcf4bbfc','nextUpdateCheck','1416136902','core','2014-03-23 01:47:16',1,'2014-11-15 19:21:42',1),(4,'1f8914c6-0f0d-4a3a-8d4c-456fdcf52850','displayUpdateNotification','0.5.0','core','2014-03-23 01:47:16',1,'2014-11-15 19:21:42',1),(5,'d507efc3-c6f1-4efc-8005-1c8b4fa6dffe','title','牛课件','blog','2014-03-23 01:47:16',1,'2014-06-23 09:25:59',1),(6,'00a3ddf2-a608-4c93-b526-a42f6a7524e9','description','','blog','2014-03-23 01:47:16',1,'2014-06-23 09:25:59',1),(7,'ec63d3ce-52d9-4a0f-84e0-038e3fce33ec','email','hong.liu@live.cn','blog','2014-03-23 01:47:16',1,'2014-06-23 09:25:59',1),(8,'ad11732e-9b79-47c3-8fef-e7972db9147c','logo','/content/images/2014/Jun/logo-1.jpg','blog','2014-03-23 01:47:16',1,'2014-06-23 09:25:59',1),(9,'d33cfcdb-4315-446f-90ab-4ed4e76e33b8','cover','','blog','2014-03-23 01:47:16',1,'2014-06-23 09:25:59',1),(10,'c0ef3231-e9ac-4ac6-a38a-e7393a0b6cde','defaultLang','en_US','blog','2014-03-23 01:47:16',1,'2014-06-23 09:25:59',1),(11,'cac07267-8c72-46a5-ad4f-baf9427ed598','postsPerPage','5','blog','2014-03-23 01:47:16',1,'2014-06-23 09:25:59',1),(12,'eec1c29c-00fd-41f5-b4bd-5a68c226c0c2','forceI18n','true','blog','2014-03-23 01:47:16',1,'2014-06-23 09:25:59',1),(13,'f244bf32-117b-4592-9f3b-fc9866b65b08','permalinks','/:slug/','blog','2014-03-23 01:47:16',1,'2014-06-23 09:25:59',1),(14,'dfd54dbc-1329-4be1-a388-fd042c6a5ee3','activeTheme','perfetta','theme','2014-03-23 01:47:16',1,'2014-06-23 09:25:59',1),(15,'49fc6709-3478-4a61-bab7-03d21a287767','activePlugins','[]','plugin','2014-03-23 01:47:16',1,'2014-03-23 01:47:16',1),(16,'af0dae6b-351c-4dd1-bdd6-2b86c3426e70','installedPlugins','[]','plugin','2014-03-23 01:47:16',1,'2014-05-01 15:30:11',1),(17,'dc976779-35d1-4ef6-8cef-8da16fb5f5d1','activeApps','[]','app','2014-05-04 23:49:19',1,'2014-06-23 09:25:59',1),(18,'da244e3f-e941-491e-bead-7d29d0443af2','installedApps','[]','app','2014-05-04 23:49:19',1,'2014-09-21 21:53:37',1);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_description` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'8e4f255a-7676-476c-b143-f9418636319c','Getting Started','getting-started',NULL,NULL,NULL,NULL,'2014-03-23 01:47:16',1,'2014-03-23 01:47:16',1),(2,'bc76b549-7181-450d-bd35-e86b4e574e37','阳光 女帽 帽子 夕阳 朝阳','yang-guang-nu-mao-mao-zi-xi-yang-zhao-yang',NULL,NULL,NULL,NULL,'2014-04-22 22:22:39',1,'2014-04-22 22:22:39',1),(3,'b73472eb-badd-4217-b9ec-03f7607cbf7a','阳光; 女帽','yang-guang-nu-mao',NULL,NULL,NULL,NULL,'2014-04-22 22:23:03',1,'2014-04-22 22:23:03',1),(4,'1f59a80c-36ee-4dc2-9402-a44952efa8eb','阳光','yang-guang',NULL,NULL,NULL,NULL,'2014-04-22 22:23:13',1,'2014-04-22 22:23:13',1),(5,'88ea8281-c8c0-432d-a2f5-adbbd71c03dd','帽子','mao-zi',NULL,NULL,NULL,NULL,'2014-04-22 22:23:17',1,'2014-04-22 22:23:17',1),(6,'1f033ccb-ce9a-4334-9334-7ded81bdb3fe','女孩','nu-hai',NULL,NULL,NULL,NULL,'2014-04-22 22:23:28',1,'2014-04-22 22:23:28',1),(7,'d3791abf-7b6f-4637-bf0f-b6cf9ce26364','泡泡','pao-pao',NULL,NULL,NULL,NULL,'2014-04-22 22:34:49',1,'2014-04-22 22:34:49',1),(8,'8d6cbc7f-9a42-4879-962b-16db5b953fb3','阳光 ','yang-guang-2',NULL,NULL,NULL,NULL,'2014-04-22 22:38:41',1,'2014-04-22 22:38:41',1),(9,'381efb6e-7ef5-4ac2-93de-1fc2f5cf38c1','铁丝网','tie-si-wang',NULL,NULL,NULL,NULL,'2014-04-22 22:38:47',1,'2014-04-22 22:38:47',1),(10,'20d0f9da-798b-42fa-8348-18433842338e','网','wang',NULL,NULL,NULL,NULL,'2014-04-22 22:39:01',1,'2014-04-22 22:39:01',1),(11,'e1cde843-123e-4eff-a8f9-d81dcfc40623','花','hua',NULL,NULL,NULL,NULL,'2014-05-01 10:46:11',1,'2014-05-01 10:46:11',1),(12,'d146b9cb-283b-40fb-88e7-50fadc64f407','鸭','ya',NULL,NULL,NULL,NULL,'2014-05-01 11:04:22',1,'2014-05-01 11:04:22',1),(13,'48040ce5-14ed-4c73-ae46-1118e678fbb3','动物','dong-wu',NULL,NULL,NULL,NULL,'2014-05-01 11:04:41',1,'2014-05-01 11:04:41',1),(14,'a6b6d50b-342c-4c31-b20b-6ec803a03229','静物','jing-wu',NULL,NULL,NULL,NULL,'2014-05-01 11:05:19',1,'2014-05-01 11:05:19',1),(15,'2db3cd67-c9d7-4bea-a077-63920579a72d','风景','feng-jing',NULL,NULL,NULL,NULL,'2014-05-01 14:53:59',1,'2014-05-01 14:53:59',1),(16,'7d7160aa-a187-4c17-a820-beac7048b3e7','静物 ','jing-wu-2',NULL,NULL,NULL,NULL,'2014-05-01 15:00:54',1,'2014-05-01 15:00:54',1),(17,'d90dddbf-65fd-46b2-a936-d60e9842474b','风景 ','feng-jing-2',NULL,NULL,NULL,NULL,'2014-05-01 15:11:47',1,'2014-05-01 15:11:47',1),(18,'352b5a30-93e8-4a96-a9e9-9167fb1622a8','植物','zhi-wu',NULL,NULL,NULL,NULL,'2014-05-04 17:41:48',1,'2014-05-04 17:41:48',1),(19,'13128bf3-fd08-45d0-8a3a-0dcd04c5cf6c','设计','she-ji',NULL,NULL,NULL,NULL,'2014-06-18 21:20:04',1,'2014-06-18 21:20:04',1),(20,'90362b34-92bc-4251-ae4d-a4239548d572','内容','nei-rong',NULL,NULL,NULL,NULL,'2014-08-22 22:33:59',1,'2014-08-22 22:33:59',1),(21,'f57b0681-171e-443e-acb7-539fee94cfd9','教程','jiao-cheng',NULL,NULL,NULL,NULL,'2014-08-22 22:34:11',1,'2014-08-22 22:34:11',1);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(254) NOT NULL,
  `image` text,
  `cover` text,
  `bio` varchar(200) DEFAULT NULL,
  `website` text,
  `location` text,
  `accessibility` text,
  `status` varchar(150) NOT NULL DEFAULT 'active',
  `language` varchar(6) NOT NULL DEFAULT 'en_US',
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_description` varchar(200) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'aff4d443-ed59-44b1-ae1a-314c1cfb3a75','Honglio','honglio','$2a$10$NbZeZoa0YJO8ZbgHgWHTPe3/ru91ywiVyrS.QHA9Lz2BQIrfdb5iO','hong.liu@live.cn','',NULL,'','hong.liu@live.cn','北京',NULL,'active','en_US',NULL,NULL,NULL,'2014-03-23 01:51:10',1,'2014-11-15 19:40:02',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-18 17:11:40
