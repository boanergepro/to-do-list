import 'package:flutter/material.dart';
import 'package:to_do_list/src/domain/entities/task.dart';

class ItemTaskWidget extends StatelessWidget {
  final Task task;
  final VoidCallback deleteTask;
  final VoidCallback editTask;
  final VoidCallback markCompleted;

  const ItemTaskWidget({
    super.key,
    required this.task,
    required this.deleteTask,
    required this.editTask,
    required this.markCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: markCompleted,
            child: Row(
              children: [
                CircleAvatar(
                  maxRadius: 15,
                  backgroundColor: task.isComplete
                      ? Theme.of(context).primaryColor
                      : Colors.grey.withOpacity(0.1),
                  child: Icon(
                    Icons.check,
                    size: 16,
                    color: task.isComplete ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  task.description,
                  style: TextStyle(
                    decoration: task.isComplete ? TextDecoration.lineThrough : null,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    color: task.isComplete ? Colors.grey.withOpacity(0.8) : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                task.scheduledDay.toString().split(' ').first,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey.withOpacity(0.1),
                ),
                onPressed: editTask,
                icon: Icon(
                  Icons.edit,
                  size: 15,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.grey.withOpacity(0.1),
                ),
                onPressed: deleteTask,
                icon: const Icon(
                  Icons.delete_forever,
                  size: 15,
                  color: Colors.red,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
