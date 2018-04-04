class AddPostgresqlExporterViews < ActiveRecord::Migration[5.1]
  def up
    execute <<~SQL
      CREATE SCHEMA IF NOT EXISTS discourse;

      CREATE VIEW discourse.pg_stat_activity
        AS SELECT * FROM pg_catalog.pg_stat_activity;

      CREATE VIEW discourse.pg_stat_replication AS
        SELECT * FROM pg_catalog.pg_stat_replication;
    SQL
  end

  def down
    execute <<~SQL
      DROP VIEW discourse.pg_stat_activity;
      DROP VIEW discourse.pg_stat_replication;
    SQL
  end
end
