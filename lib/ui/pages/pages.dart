import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:sample_db_sqflite/bloc/detail_news/detail_news_bloc.dart';
import 'package:sample_db_sqflite/bloc/list_news/list_news_bloc.dart';
import 'package:sample_db_sqflite/models/detail_news/detail_news.dart';
import 'package:sample_db_sqflite/models/models.dart';
import 'package:sample_db_sqflite/models/news/news.dart';
import 'package:sample_db_sqflite/services/services.dart';
import 'package:sample_db_sqflite/shared/shared.dart';
import 'package:sample_db_sqflite/ui/widgets/widgets.dart';
import 'package:sample_db_sqflite/models/models.dart';
import 'package:sample_db_sqflite/utils/handle_error.dart';
import 'package:get/get.dart';
import 'package:sample_db_sqflite/utils/local_database.dart';


part 'main_page.dart';
part 'detail_page.dart';
part 'list_favorite_page.dart';

