# frozen_string_literal: true

class DropCaptainTables < ActiveRecord::Migration[7.1]
  def up
    # Drop tables in reverse dependency order to avoid foreign key constraints
    drop_table :copilot_messages, if_exists: true
    drop_table :copilot_threads, if_exists: true
    drop_table :captain_assistant_responses, if_exists: true
    drop_table :captain_inboxes, if_exists: true
    drop_table :captain_documents, if_exists: true
    drop_table :captain_custom_tools, if_exists: true
    drop_table :captain_scenarios, if_exists: true
    drop_table :captain_assistants, if_exists: true
    drop_table :article_embeddings, if_exists: true
  end

  def down
    # This migration is not reversible as we're permanently removing Captain functionality
    # If you need to restore, you'll need to run the original migrations again
    raise ActiveRecord::IrreversibleMigration
  end
end
