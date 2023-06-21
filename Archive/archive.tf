terraform {
  required_providers {
    archive = {
      source = "hashicorp/archive"
    }

    random = {
      source = "hashicorp/random"
    }
  }
}

resource "random_string" "random" {
  length = 10
  special = false
}

data "archive_file" "arquivozip" {
  type        = "zip"
  source_file = "data_backup/data.txt"
  output_path = "backup.zip"
}

output "arquivozip" {
  value = data.archive_file.arquivozip.output_size
}

output "random_string" {
  value = random_string.random.result
}

data "archive_file" "arquivzip" {
  type        = "zip"
  source_file = "data_backup/data.txt"
  output_path = "${random_string.random.result}.zip"
}