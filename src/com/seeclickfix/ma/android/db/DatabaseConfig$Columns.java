package com.seeclickfix.ma.android.db;

public class DatabaseConfig$Columns
{
  public static class Answers
  {
    public static final String DB_ID = "id";
    public static final String PRIMARY_API_KEY = "primary_api_key";
    public static final String TEXT = "question_text";
  }
  
  public static class City
  {
    public static final String ID = "_id";
    public static final String NAME = "name";
    public static final String POPULATION = "population";
    public static final String STATE = "state";
  }
  
  public static class Comments
  {
    public static final String API_ID = "api_id";
    public static final String DATE_CREATED = "date_created";
    public static final String DATE_UPDATED = "date_updated";
    public static final String EMAIL = "email";
    public static final String ID = "id";
    public static final String IMAGE_SMALL_URL = "image_small_url";
    public static final String IMAGE_SQUARE_URL = "image_square_url";
    public static final String IMAGE_URL = "image_url";
    public static final String ISSUE_API_ID = "issue_api_id";
    public static final String NAME = "name";
    public static final String TEXT = "text";
    public static final String TYPE = "type";
    public static final String VIDEO_PATH = "video_path";
    public static final String YOUTUBE_URL = "youtube_url";
  }
  
  public static class EnhancedWatchArea
  {
    public static final String API_ID = "api_id";
    public static final String BACKGROUND_COLOR = "background_color";
    public static final String BUTTON_COLOR = "button_color";
    public static final String CREATED_AT = "created_at";
    public static final String DB_ID = "id";
    public static final String DEMO_CODE = "demo_code";
    public static final String DESCRIPTION = "description";
    public static final String HIGHLIGHT_COLOR = "highlight_color";
    public static final String LOGO_URL = "logo_url";
    public static final String MOBILE_BUTTONS_DB = "mobile_buttons_db";
    public static final String START_GRADIENT_BTN_COLOR = "start_gradient_button_color";
    public static final String TEXT_COLOR = "text_color";
    public static final String TITLE = "title";
    public static final String UPDATED_AT = "updated_at";
  }
  
  public static class IssPlaceJoins
  {
    public static final String DATE_CREATED = "date_created";
    public static final String DISTANCE = "distance";
    public static final String ISSUE = "issue_id";
    public static final String PLACE = "place_id";
  }
  
  public static class Issues
  {
    public static final String ADDRESS = "address";
    public static final String ANONYMIZE_REPORTER = "anonymize_reporter";
    public static final String BITLY = "bitly";
    public static final String CATEGORY_ICON = "category_icon";
    public static final String COMMENT_IMG_LARGE = "comment_img_large";
    public static final String COMMENT_IMG_SMALL = "comment_img_small";
    public static final String CREATED_AT = "created_at";
    public static final String CREATED_AT_EPOCH = "created_at_epoch";
    public static final String DESCRIPTION = "description";
    public static final String FOLLOWING = "following";
    public static final String ICON_SQUARE = "icon_square";
    public static final String ID = "id";
    public static final String LAT = "lat";
    public static final String LNG = "lng";
    public static final String MINUTES_SINCE_CREATED = "minutes_since_created";
    public static final String NUM_CMT_EX_ACTIVITY = "comment_count_excluding_activity";
    public static final String NUM_COMMENTS = "num_comments";
    public static final String PHOTO_LARGE_URL = "photo_large_url";
    public static final String PHOTO_SMALL_URL = "photo_small_url";
    public static final String PHOTO_SQUARE_URL = "photo_square_url";
    public static final String RATING = "rating";
    public static final String REPORTER_DISPLAY = "reporter_display";
    public static final String SLUG = "slug";
    public static final String STATUS = "status";
    public static final String SUMMARY = "summary";
    public static final String TYPE = "type";
    public static final String UPDATED_AT = "updated_at";
    public static final String UPDATED_AT_RAW = "updated_at_raw";
    public static final String USER_ID = "user_id";
    public static final String VOTED_BEFORE = "voted_before";
  }
  
  public static class Places
  {
    public static final String API_ID = "api_id";
    public static final String CUSTOM = "custom";
    public static final String DB_ID = "id";
    public static final String IGNORED = "ignored";
    public static final String LAST_API_UPDATE = "last_api_update";
    public static final String LAST_QUERY = "last_issue_query";
    public static final String LAT = "lat";
    public static final String LNG = "lng";
    public static final String MY_LOCATION = "my_location";
    public static final String NAME = "name";
    public static final String PAGE_NUMBER = "page_number";
    public static final String SELECTED = "selected";
    public static final String SLUG = "slug";
    public static final String STATE = "state";
  }
  
  public static class Questions
  {
    public static final String API_ID = "api_id";
    public static final String DATE_CREATED = "date_created";
    public static final String DATE_UPDATED = "date_updated";
    public static final String DB_ID = "id";
    public static final String DEFAULT_VALUES = "default_vaules";
    public static final String DISPLAYED_ANSWER = "displayed_answer";
    public static final String POSITION = "position";
    public static final String PRIMARY_API_KEY = "primary_api_key";
    public static final String REQUIRED = "required";
    public static final String SELECTABLE_VALUES = "selectable_values";
    public static final String TEXT = "question_text";
    public static final String TYPE = "type";
  }
  
  public static class Reports
  {
    public static final String ID = "id";
    public static final String REPORT_STATE = "report_state";
    public static final String REQ_TYPE_ID = "req_type_id";
    public static final String USING_CURRENT_LOC = "using_current_loc";
    public static final String WATCH_AREAS = "watch_areas";
  }
  
  public static class ReqWatchArea
  {
    public static final String API_ID = "api_id";
    public static final String DB_ID = "id";
    public static final String ID = "id";
    public static final String INCLUDES_POINT = "includes_point";
    public static final String POSITION = "position";
    public static final String REQUEST_TYPES = "request_types_db";
    public static final String TITLE = "title";
  }
  
  public static class RequestType
  {
    public static final String ACTION = "action";
    public static final String ACTION_DATA = "action_data";
    public static final String API_ID = "api_id";
    public static final String DB_ID = "id";
    public static final String HEADER_TITLE = "header_title";
    public static final String NUM_QUESTIONS = "num_questions";
    public static final String POSITION = "position";
    public static final String TITLE = "title";
    public static final String VIEW_TYPE = "view_type";
    public static final String WATCH_AREA = "watch_area";
  }
  
  public static class SimpleCenter
  {
    public static final String ID = "id";
    public static final String LAT = "lat";
    public static final String LNG = "lng";
  }
  
  public static class ZoneWrappers
  {
    public static final String API_ID = "api_id";
    public static final String DB_ID = "id";
    public static final String WATCH_AREAS_DB = "watchAreasDb";
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.DatabaseConfig.Columns
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */