package com.seeclickfix.ma.android.db;

import com.j256.ormlite.dao.RawRowMapper;
import com.seeclickfix.ma.android.objects.issue.Issue;

public class SqlViews
{
  public static final String issuesByPlaceSQLString = "CREATE VIEW IF NOT EXISTS issues_by_place AS SELECT DISTINCT i.id as id,i.user_id as user_id,i.address as address,i.description as description,i.lat as lat,i.lng as lng,i.anonymize_reporter as anonymize_reporter,i.summary as summary,i.num_comments as num_comments,i.bitly as bitly,i.slug as slug,i.rating as rating,i.status as status,i.type as type,i.updated_at as updated_at,i.updated_at_raw as updated_at_raw,i.comment_count_excluding_activity as comment_count_excluding_activity,i.following as following,i.icon_square as icon_square,i.photo_large_url as photo_large_url,i.photo_small_url as photo_small_url,i.photo_square_url as photo_square_url,i.minutes_since_created as minutes_since_created,i.voted_before as voted_before,i.created_at_epoch as created_at_epoch,i.created_at as created_at,i.reporter_display as reporter_display,p.id as place_id FROM issues i, places p, issue_place_join j WHERE j.place_id = p.id AND j.issue_id = i.id";
  RawRowMapper<Issue> issueByPlaceRowMapper = new RawRowMapper()
  {
    public Issue mapRow(String[] paramAnonymousArrayOfString1, String[] paramAnonymousArrayOfString2)
    {
      return new Issue();
    }
  };
  
  public static class Tables
  {
    public static final String ISSUES_BY_PLACE = "issues_by_place";
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.db.SqlViews
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */